import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/methods/notes_search_delegate.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Notes',
          icon: Icons.search,
          onPressed: () async {
            final notes = BlocProvider.of<NotesCubit>(context).notes;
            await showSearch(
              context: context,
              delegate: NoteSearchDelegate(notes!),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Expanded(
          child: NoteListView(),
        ),
      ],
    );
  }
}
