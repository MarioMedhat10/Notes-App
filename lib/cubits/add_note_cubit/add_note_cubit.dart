import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  Color noteColor = const Color(0xff247BA0);

  addNote(NoteModel note) async {
    note.color = noteColor.value;
    emit(AddNoteLoadingState());

    try {
      Box<NoteModel> notesBox = Hive.box(kNotesBox);
      await notesBox.add(note);

      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
