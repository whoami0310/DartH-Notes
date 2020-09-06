import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/screens/note/note_screen.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final NoteStore note;

  NoteTile(this.note) {
    print(note);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => NoteScreen(note: note)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: customColors[note.color],
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
                note.textContent, //?? note.checkContent ?? "",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(top: 4),
                  //   padding: EdgeInsets.symmetric(
                  //     vertical: 4,
                  //     horizontal: 4,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   alignment: Alignment.center,
                  //   child:

                  Text(note.dateHour,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      )),

                  //)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
