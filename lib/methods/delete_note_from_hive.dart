import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

Future<void> deleteNoteFromHive(NoteModel note) async {
  final box = await Hive.openBox<NoteModel>(kNotesBox);
  await box.delete(note.key);
}
