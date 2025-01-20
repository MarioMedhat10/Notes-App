import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int chosenIndex = 0;

  final List<Color> color = const [
    Color(0xff247BA0),
    Color(0xff70C1B3),
    Color(0xffB2DBBF),
    Color(0xffF3FFBD),
    Color(0xffFF1654),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                chosenIndex = index;
              });
            },
            child: ColorItem(
              isChosen: chosenIndex == index ? true : false,
              color: color[index],
            ),
          );
        },
      ),
    );
  }
}
