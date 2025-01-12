import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 40,
          right: 24,
          left: 24,
        ),
        child: NotesViewBody(),
      ),
    );
  }
}
