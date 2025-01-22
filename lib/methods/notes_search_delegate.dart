import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/build_search_results.dart';

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
    return BuildSearchResults(query: query, notes: notes);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        notes.where((note) => note.title.contains(query)).toList();
    final Set<String> uniqueTitles =
        suggestions.map((note) => note.title).toSet();
    final List<String> notesTitles = uniqueTitles.toList();

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
