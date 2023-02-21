import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight font;
  const MyText({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    this.font = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: font,
      ),
    );
  }
}
