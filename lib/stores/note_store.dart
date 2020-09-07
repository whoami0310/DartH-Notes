import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final firestore = Firestore.instance;

  @observable //Not needed for now
  String title = "";

  @observable
  int color;

  @observable
  String dateHour = "";

  @observable //Not needed for now
  String textContent = "";

  @observable //Not needed for now
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

  Future<void> update({
    @required VoidCallback onFail,
  }) async {
    firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd") //Change this
        .collection("notes")
        .document(id)
        .updateData(toMap())
        .catchError((e) {
      onFail();
    });
  }

  Future<void> save({
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd") //Change this
        .collection("notes")
        .add(toMap())
        .then((d) {
      onSuccess();
    }).catchError((e) {
      onFail();
    });
  }

  Future<void> delete({
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        .document(id)
        .delete()
        .then((value) {
      onSuccess();
      isDeleted = true;
    }).catchError((e) {
      onFail();
    });
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
