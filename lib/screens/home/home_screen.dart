import 'package:darthnotes/screens/home/components/custom_widget_app_bar.dart';
import 'package:darthnotes/screens/home/components/note_tile.dart';
import 'package:darthnotes/screens/note/note_screen.dart';
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
        preferredSize: Size.fromHeight(200),
        child: CustomWidgetAppBar(),
      ),
      body: Observer(
        builder: (context) {
          var lista = notesStore.allNotesFiltered;

          return notesStore.viewInList
              ? ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 10);
                  },
                  padding: EdgeInsets.all(16),
                  itemCount: lista.length,
                  itemBuilder: (_, index) {
                    return NoteTile(lista[index]);
                  },
                )
              : GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return NoteTile(lista[index]);
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => NoteScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
