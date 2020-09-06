import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:darthnotes/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NoteScreen extends StatelessWidget {
  final NoteStore note;

  NoteScreen({note}) : this.note = note != null ? note : NoteStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: customColors[note.color],
        appBar: AppBar(
          backgroundColor: customColors[note.color],
          elevation: 0,
          title: Text(
            note.dateHour ?? "",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          centerTitle: true,
          actions: [
            CustomIconButton(
              iconData: Icons.delete,
              onTap: () {},
            ),
            SizedBox(width: 16),
            CustomIconButton(
                iconData: note.id != null ? Icons.refresh : Icons.save,
                onTap: () {
                  if (note.id != null)
                    note.updateNote();
                  else
                    note.saveNote(
                      onSuccess: () {
                        Navigator.of(context).pop();
                      },
                    );
                }),
            SizedBox(width: 12),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            //Title
            CustomTextField(
                initialValue: note.title ?? "",
                textFontSize: 20,
                hintFontSize: 20,
                hintText: "Título",
                onChanged: note.setTitle),

            //Content
            CustomTextField(
                initialValue: note.textContent ?? "",
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textFontSize: 16,
                hintFontSize: 16,
                hintText: "Conteúdo da nota",
                onChanged: note.setTextContent),
          ],
        ),
        floatingActionButton: SpeedDial(
          child: Icon(
            Icons.blur_on,
            color: Colors.white,
          ),
          //backgroundColor: Colors.white,
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: customColors
              .asMap()
              .entries
              .map((v) => SpeedDialChild(
                  child: Container(
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: v.value,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  //label: v.key,
                  labelStyle: TextStyle(fontSize: 14),
                  onTap: () {
                    note.setColor(v.key);
                  }))
              .toList(),
        ),
      );
    });
  }
}
