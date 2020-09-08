import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/stores/notes_store.dart';
import 'package:darthnotes/common/custom_text_field.dart';
import 'package:darthnotes/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomWidgetAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notesStore = Provider.of<NotesStore>(context);
    final userStore = Provider.of<UserStore>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      SizedBox(height: 36),
      Image.asset(
        "images/title.png",
        width: 200,
        ),
      Container(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        decoration: BoxDecoration(
          color: secondaryDark,
          borderRadius: BorderRadius.circular(15),
          ),
        child: Row(
          children: [
          Expanded(
            child: CustomTextField(
              iscollapsed: true,
              autofocus: false,
              textFontSize: 18,
              hintFontSize: 18,
              hintText: "Pesquisar suas notas",
              onChanged: notesStore.search),
            ),
          Observer(
            builder: (c) {
              return CustomIconButton(
                radius: 7, //TODO Confirm if this is still working
                iconData:
                notesStore.viewInList ? Icons.list : Icons.grid_on,
                onTap: notesStore.toggleView,
                );
              },
              ),
          SizedBox(width: 12),
          Observer(
            builder: (c) {
              return GestureDetector(
                onTap: userStore.login, 
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  backgroundImage: userStore.user != null
                  ? NetworkImage(userStore.user.photoUrl)
                  : AssetImage("images/user.png"),
                  ),
                );
              },
              ),
          SizedBox(width: 6)
          ],
          ),
        ),
      ],
      );
  }
}
