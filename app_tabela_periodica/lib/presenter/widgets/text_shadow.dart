import 'package:flutter/material.dart';

class TextShadow extends StatelessWidget {
  final String text;
  final TextStyle? styleShadow;
  final TextStyle? style;
  const TextShadow({
    Key? key,
    required this.text,
    this.styleShadow,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(text, style: styleShadow),
        Text(text, style: style),
      ],
    );
  }
}
