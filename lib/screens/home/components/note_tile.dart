import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/screens/note/note_screen.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final NoteStore note;

  NoteTile(this.note);

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
            ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              Text(
                note.textContent,
                maxLines: 8,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  ),
                ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(note.dateHour,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    )),
                ],
                )
              ],
              ),
            ),
          ),
        );
  }
}
