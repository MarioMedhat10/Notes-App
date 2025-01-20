import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/methods/save_note.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = widget.noteModel.title;
    content.text = widget.noteModel.content;

    return Column(
      children: [
        CustomAppBar(
          title: 'Edit Note',
          icon: Icons.done,
          onPressed: () async {
            await saveNote(
              title: title.text,
              content: content.text,
              widget: widget,
            );
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: 'Title',
          controller: title,
          onChanged: (value) {
            title.text = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          hintText: 'Content',
          controller: content,
          onChanged: (value) {
            content.text = value;
          },
          maxLines: 5,
        ),
      ],
    );
  }


}
