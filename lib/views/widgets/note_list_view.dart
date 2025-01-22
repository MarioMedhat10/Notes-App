import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];

        notes.sort((a, b) => b.date.compareTo(a.date));

        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteItem(
              noteModel: notes[index],
              onDelete: () async {
                await notes[index].delete();

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            );
          },
        );
      },
    );
  }
}
