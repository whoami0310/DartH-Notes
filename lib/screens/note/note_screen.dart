import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:darthnotes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NoteScreen extends StatelessWidget {
  final NoteStore note;

  NoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: note.color,
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
        floatingActionButton: SpeedDial(
          child: Icon(
            Icons.blur_on,
            color: Colors.white,
          ),
          //backgroundColor: Colors.white,
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: customColors.entries
              .map((v) => SpeedDialChild(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: v.value,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  //label: v.key,
                  labelStyle: TextStyle(fontSize: 14),
                  onTap: () {
                    note.setColor(v.value);
                  }))
              .toList(),
        ),
      );
    });
  }
}
