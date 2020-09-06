import 'package:darthnotes/common/custom_icon_button.dart';
import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/stores/notes_store.dart';
import 'package:darthnotes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomWidgetAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notesStore = Provider.of<NotesStore>(context);

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
                    textFontSize: 18,
                    hintFontSize: 18,
                    hintText: "Pesquisar suas notas",
                    onChanged: notesStore.search),
              ),
              CustomIconButton(
                iconData: Icons.list,
                onTap: () {},
              ),
              SizedBox(width: 12),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/user.png"),
              ),
              SizedBox(width: 6)
            ],
          ),
        ),
      ],
    );
  }
}
