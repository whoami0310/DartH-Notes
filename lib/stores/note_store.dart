import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/helper/enums.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  _NoteStoreBase({this.color = Colors.black});

  final firestore = Firestore.instance;

  @observable
  String title;

  @observable
  Color color;

  @observable
  String dateHour;

  @observable
  String textContent;

  @observable
  noteTypes type;

  String id;

  @action
  void setColor(Color color) => this.color = color;

  @action
  void setTitle(text) => title = text;

  @action
  void setTextContent(text) => textContent = text;

  Future<void> saveNote() async {
    var updatedate = DateTime.now().toString();
    dateHour = updatedate;
    await firestore
        .collection("users")
        .document("Uuu7lTgsw3gnpdII6byd")
        .collection("notes")
        //.document(id).updateData(
        .add({
      "type": "TEXT",
      "title": title,
      "date_hour": updatedate,
      "text_content": textContent,
      "color": reversedCustomColors[color]
    });
  }

  _NoteStoreBase.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    type = noteTypes.TEXT; // TODO Fix: Set dynamic
    title = doc.data["title"];
    dateHour = doc.data["date_hour"];
    textContent = doc.data["text_content"];
    color = customColors[doc.data["color"]];
  }

  toMap() {
    return {
      "type": type,
      "title": title,
      "date_hour": dateHour,
      "text_content": textContent,
      "color": color //TODO fix retur to String
    };
  }
}
