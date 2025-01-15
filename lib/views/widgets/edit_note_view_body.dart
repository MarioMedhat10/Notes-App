import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Edit Note',
          icon: Icons.done,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: 'Title',
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          hintText: 'Content',
          maxLines: 5,
        ),
        SizedBox(
          height: 64,
        ),
        CustomButton(
          text: 'Edit',
        ),
      ],
    );
  }
}
