import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int chosenIndex;

  @override
  void initState() {
    chosenIndex = kNoteColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: kNoteColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                chosenIndex = index;
                widget.noteModel.color = kNoteColors[index].value;
              });
            },
            child: ColorItem(
              isChosen: chosenIndex == index ? true : false,
              color: kNoteColors[index],
            ),
          );
        },
      ),
    );
  }
}
