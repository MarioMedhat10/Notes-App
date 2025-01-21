import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isChosen,
    required this.color,
  });

  final bool isChosen;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isChosen
        ?  CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 26,
            ),
          )
        :  CircleAvatar(
            backgroundColor: color,
            radius: 30,
          );
  }
}
