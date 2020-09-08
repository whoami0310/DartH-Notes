import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;

abstract class _NotesStoreBase extends ChangeNotifier with Store {

  //Class extends ChangeNotifier because of Provider (ChangeNotifyPRoxyProvider)

  // Variable userd to get current user 
  FirebaseUser user;

  //Method to set current user when UserStore get logged
  void updateUser(FirebaseUser user) {
    if (user != null){
      this.user = user;
      _loadAllNotes();
    }
  }

  //Reference of user notes in Firebase
  CollectionReference get notesReference =>
  Firestore.instance.collection('users/${user.uid}/notes');

  //Short instance
  final firestore = Firestore.instance;

  List allNotes = [];

  @observable
  String _search = "";

  //In the future add value to SharedPeferences
  @observable
  bool viewInList = true;

  @action
  toggleView() => viewInList = !viewInList;

  @action
  search(String text) => _search = text;

  List get allNotesFiltered {
    var allNotesFiltered = ObservableList();
    if (_search.isNotEmpty) {
      allNotesFiltered.addAll(List.from(allNotes.where(
        (e) => e.title.toLowerCase().contains(_search.toLowerCase()))));
      } else {
        allNotesFiltered.addAll(allNotes);
      }
      return allNotesFiltered;
    }

    Future<void> _loadAllNotes() async {
      allNotes.clear();
      QuerySnapshot query = await firestore
      .collection("users")
      .document(user.uid)
      .collection("notes")
      .getDocuments();
      
      allNotes.addAll(
        query.documents.map((doc) => NoteStore.fromDocument(doc)).toList());

      search("");
    }

    //-=-=

    Future<void> update(NoteStore note) async {
      allNotes
      ..removeWhere((e) => e.id == note.id)
      ..add(note);

      search("");

      notesReference.document(note.id).updateData(note.toMap());
    }

    Future<void> delete(NoteStore note) async {
      allNotes.removeWhere((e) => e.id == note.id);

      search("");

      notesReference.document(note.id).delete();
    }

    Future<void> save(NoteStore note) async {
      notesReference.add(note.toMap()).then((d) {
        allNotes.add(note..id = d.documentID);
        search("");
        });
    }
  }
