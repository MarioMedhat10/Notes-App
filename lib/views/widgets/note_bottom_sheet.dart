import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}
