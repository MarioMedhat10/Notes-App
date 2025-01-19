import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 24,
          left: 24,
        ),
        child: EditNoteViewBody(
          noteModel: noteModel,
        ),
      ),
    );
  }
}
