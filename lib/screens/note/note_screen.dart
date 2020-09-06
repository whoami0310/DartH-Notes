import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/models/note_model.dart';
import 'package:darthnotes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final NoteModel note;

  NoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors[note.color],
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
          //Title
          CustomTextField(
              initialValue: note.title,
              textFontSize: 20,
              hintFontSize: 20,
              hintText: "Título",
              onChanged: (text) {}),

          //Content
          CustomTextField(
              initialValue: note.textContent,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textFontSize: 16,
              hintFontSize: 16,
              hintText: "Conteúdo da sua nota",
              onChanged: (text) {}),
        ],
      ),
    );
  }
}
