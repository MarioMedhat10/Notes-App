import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
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
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Edit Note',
          icon: Icons.done,
          onPressed: () async {
            if (title != null ||
                title != '' ||
                title != widget.noteModel.title) {
              widget.noteModel.title = title ?? widget.noteModel.title;
            }

            if (content != null ||
                content != '' ||
                content != widget.noteModel.content) {
              widget.noteModel.content = content ?? widget.noteModel.content;
            }

            await widget.noteModel.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: 'Title',
          onChanged: (value) {
            title = value.trim();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          hintText: 'Content',
          onChanged: (value) {
            content = value.trim();
          },
          maxLines: 5,
        ),
      ],
    );
  }
}
