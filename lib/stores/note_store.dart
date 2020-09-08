import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {

  //Short instance
  final firestore = Firestore.instance;

  // I aim to introduce a progress indicator to show how far is to complete the note
  @observable //Not needed for now
  String title = "";

  @observable //Not needed for now
  String textContent = "";

  @observable //Not needed for now
  int type = 0;

  @observable
  int color;

  @observable
  String dateHour;

  String id;

  bool isDeleted = false;

  @action
  void setColor(int color) => this.color = color;

  @action
  void setTitle(text) => title = text;

  @action
  void setTextContent(text) => textContent = text;

  //Constructor
  _NoteStoreBase({this.color = 0}) {
    dateHour = getCurrentUpdateDateTime();
  }


  String getCurrentUpdateDateTime() {
    final dateTime =
    DateFormat('dd/MM/yyyy-HH:mm').format(DateTime.now()).split("-");
    return "Atualizado em ${dateTime[0]} às ${dateTime[1]}";
  }

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
      "date_hour": dateHour,
      "text_content": textContent,
      "color": color
    };
  }
}
