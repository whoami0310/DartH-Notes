import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/stores/note_store.dart';
import 'package:darthnotes/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NoteScreen extends StatelessWidget {
  final NoteStore note;

  NoteScreen({note}) : this.note = note != null ? note : NoteStore();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      if (note.isDeleted) {
        return true;
      }

      if (note.id != null) {
        await note.update(onFail: () {
          //TODO add snackbar
        });
      } else {
        note.save(onSuccess: () {
          Navigator.of(context).pop();
        }, onFail: () {
          //TODO add snackbar
        });
      }
      return true;
    }, child: Observer(builder: (_) {
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
            note.id != null
                ? CustomIconButton(
                    iconData: Icons.delete,
                    onTap: () {
                      note.delete(onSuccess: () {
                        Navigator.of(context).pop();
                      }, onFail: () {
                        // TODO add Snackbar
                      });
                    },
                  )
                : Container(),
            SizedBox(width: 12),
          ],
        ),
        body: SlidingUpPanel(
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
          maxHeight: 150,
          minHeight: 50,
          panel: Container(
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: secondaryDark,
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Opções ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        size: 15,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 8),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (c, i) {
                      return SizedBox(width: 4);
                    },
                    itemCount: customColors.length,
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () {
                          note.setColor(i);
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          child: i == note.color
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : SizedBox.shrink(),
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: customColors[i],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
