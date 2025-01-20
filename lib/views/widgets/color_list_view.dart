import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ColorItem();
        },
      ),
    );
  }
}
