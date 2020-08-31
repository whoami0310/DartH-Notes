import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darthnotes/models/note_model.dart';
import 'package:mobx/mobx.dart';
part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;

abstract class _NotesStoreBase with Store {
  _NotesStoreBase() {
    _loadAllNotes();
  }

  final firestore = Firestore.instance;
  List allNotes = [];

  @observable
  String _search = "";

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
    QuerySnapshot query = await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .getDocuments();
    allNotes.addAll(
        query.documents.map((doc) => NoteModel.fromDocument(doc)).toList());

    search("");
  }
}
