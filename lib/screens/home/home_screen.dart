import 'package:darthnotes/screens/home/components/custom_widget_app_bar.dart';
import 'package:darthnotes/screens/note/components/note_tile.dart';
import 'package:darthnotes/stores/notes_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notesStore = Provider.of<NotesStore>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: CustomWidgetAppBar(),
      ),
      body: Observer(
        builder: (context) {
          var lista = notesStore.allNotesFiltered;
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Divider(height: 10);
            },
            padding: EdgeInsets.all(16),
            itemCount: lista.length,
            itemBuilder: (_, index) {
              return NoteTile(lista[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
