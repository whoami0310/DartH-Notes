import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final NoteModel note;

  NoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          CustomIconButton(
            iconData: Icons.delete,
            onTap: () {},
          ),
          SizedBox(width: 16),
          CustomIconButton(
            iconData: Icons.save,
            onTap: () {},
          ),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextFormField(
            initialValue: note.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Título",
                hintStyle: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                )),
          ),

          //Content
          TextFormField(
              initialValue: note.textContent,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Título",
                  hintStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  )))
        ],
      ),
    );
  }
}
