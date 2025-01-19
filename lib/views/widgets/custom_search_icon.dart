import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        splashRadius: 25,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
