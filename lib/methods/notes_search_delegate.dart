import 'package:flutter/material.dart';
import 'package:notes_app/methods/get_note_titles.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<NoteModel> notes;

  NoteSearchDelegate(this.notes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<NoteModel> results =
        notes.where((NoteModel note) => note.title.contains(query)).toList();

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: results.length,
        itemBuilder: (context, index) {
          return NoteItem(noteModel: results[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        notes.where((note) => note.title.contains(query)).toList();
    final List<String> notesTitles = getNoteTitles(suggestions);

    return ListView.builder(
      itemCount: notesTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notesTitles[index]),
          onTap: () {
            query = notesTitles[index];
            showResults(context);
          },
        );
      },
    );
  }
}
