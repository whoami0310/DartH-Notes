import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final firestore = Firestore.instance;

  @observable
  String title = "";

  @observable
  int color;

  @observable
  String dateHour = "";

  @observable
  String textContent = "";

  @observable
  int type = 0;

  String id;

  bool isDeleted = false;

  @action
  void setColor(int color) => this.color = color;

  @action
  void setTitle(text) => title = text;

  @action
  void setTextContent(text) => textContent = text;

  String getCurrentUpdateDateTime() {
    final dateTime =
        DateFormat('dd/MM/yyyy-HH:mm').format(DateTime.now()).split("-");
    return "Atualizado em ${dateTime[0]} às ${dateTime[1]}";
  }

  Future<void> updateNote() async {
    await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .document(id)
        .updateData(toMap());
  }

  Future<void> saveNote({@required VoidCallback onSuccess}) async {
    await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .add(toMap());

    onSuccess();
  }

  Future<void> deleteNote({@required VoidCallback onSuccess}) async {
    await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .document(id)
        .delete();

    isDeleted = true;

    onSuccess();
  }

  _NoteStoreBase({this.color = 0});

  _NoteStoreBase.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    type = doc.data["type"];
    title = doc.data["title"];
    dateHour = doc.data["date_hour"];
    textContent = doc.data["text_content"];
    color = doc.data["color"];
  }

  toMap() {
    return {
      "type": type,
      "title": title,
      "date_hour": getCurrentUpdateDateTime(),
      "text_content": textContent,
      "color": color
    };
  }
}
