import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  fetchAllNotes() {
    try {
      Box<NoteModel> notesBox = Hive.box(kNotesBox);

      emit(NotesSuccessState(notes: notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailureState(e.toString()));
    }
  }
}
