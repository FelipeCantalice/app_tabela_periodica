import 'package:flutter/material.dart';

class DetailsDescription extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  const DetailsDescription({
    Key? key,
    required this.title,
    required this.icon,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Container(
        constraints: BoxConstraints(minWidth: 210, minHeight: 210),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Icon(icon),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      theme.textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  description ?? 'unknown',
                  style: descriptionStyle ?? theme.textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
