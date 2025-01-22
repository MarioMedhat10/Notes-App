import 'package:notes_app/models/note_model.dart';

List<String> getNoteTitles(List<NoteModel> notes) {
  List<String> titles = [];
  for (var note in notes) {
    titles.add(note.title);
  }
  return titles;
}
