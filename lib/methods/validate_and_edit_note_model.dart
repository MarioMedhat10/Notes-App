import 'package:notes_app/views/widgets/edit_note_view_body.dart';

Future<void> validateAndEditNoteModel({
  String? title,
  String? content,
  required EditNoteViewBody widget,
}) async {
  if (title != null || title != '' || title != widget.noteModel.title) {
    widget.noteModel.title = title?.trim() ?? widget.noteModel.title;
  }

  if (content != null ||
      content != '' ||
      content != widget.noteModel.content) {
    widget.noteModel.content = content?.trim() ?? widget.noteModel.content;
  }

  await widget.noteModel.save();
}