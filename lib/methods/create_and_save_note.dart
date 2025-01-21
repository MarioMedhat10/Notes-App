import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

void createAndSaveNote({
  required BuildContext context,
  required String title,
  required String content,
}) {
  var currentDate = DateTime.now();
  var formattedCurrentDate =
      DateFormat("d MMM yyyy, h:mm a").format(currentDate);

  NoteModel noteModel = NoteModel(
    title: title,
    content: content,
    date: formattedCurrentDate,
    color: BlocProvider.of<AddNoteCubit>(context).noteColor.value,
  );

  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
}
