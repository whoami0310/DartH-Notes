import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String type;
  String title;
  String dateHour;
  String textContent;
  List checkContent;

  NoteModel.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    type = doc.data["type"];
    title = doc.data["title"];
    dateHour = doc.data["date_hour"];
    textContent = doc.data["text_content"];
    checkContent = doc.data["check_content"];
  }

  toMap() {
    return {
      "type": type,
      "title": title,
      "date_hour": dateHour,
      "text_content": textContent,
      "check_content": checkContent
    };
  }
}
