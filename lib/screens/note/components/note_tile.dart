import 'package:darthnotes/models/note_model.dart';
import 'package:darthnotes/screens/note/note_screen.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;

  NoteTile(this.note);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => NoteScreen(note)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                note.textContent ?? note.checkContent ?? "",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Divider(height: 5),
              Container(
                alignment: Alignment.center,
                child: Text(note.dateHour,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
