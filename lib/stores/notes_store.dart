import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:mobx/mobx.dart';
part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;

abstract class _NotesStoreBase with Store {
  _NotesStoreBase() {
    loadAllNotes();
  }

  final firestore = Firestore.instance;
  List allNotes = [];

  @observable
  String _search = "";

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

  Future<void> loadAllNotes() async {
    allNotes.clear();
    QuerySnapshot query = await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .getDocuments();
    allNotes.addAll(
        query.documents.map((doc) => NoteStore.fromDocument(doc)).toList());

    search("");
  }
}
