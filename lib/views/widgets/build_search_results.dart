import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/methods/delete_note_from_hive.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class BuildSearchResults extends StatefulWidget {
  const BuildSearchResults({
    super.key,
    required this.query,
    required this.notes,
  });

  final String query;
  final List<NoteModel> notes;

  @override
  State<BuildSearchResults> createState() => _BuildSearchResultsState();
}

class _BuildSearchResultsState extends State<BuildSearchResults> {
  List<NoteModel> results = [];

  @override
  void initState() {
    results = widget.notes
        .where((NoteModel note) => note.title.contains(widget.query))
        .toList();

    results.sort((a, b) => b.date.compareTo(a.date));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 15,
            right: 24,
            left: 24,
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
              return NoteItem(
                noteModel: results[index],
                onDelete: () async {
                  await deleteNoteFromHive(results[index]);
                  results.removeAt(index);
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  // setState(() {});
                },
              );
            },
          ),
        );
      },
    );
  }
}
