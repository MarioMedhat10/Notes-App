import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  List<NoteModel>? notes;

  fetchAllNotes() {
    Box<NoteModel> notesBox = Hive.box(kNotesBox);

    notes = notesBox.values.toList();

    emit(NotesSuccessState());
  }
}
