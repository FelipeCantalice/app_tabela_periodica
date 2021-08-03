import 'package:flutter/material.dart';

class DetailsDescription extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  const DetailsDescription({
    Key? key,
    required this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle ??
                theme.textTheme.bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            description ?? 'unknown',
            style: descriptionStyle ?? theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
