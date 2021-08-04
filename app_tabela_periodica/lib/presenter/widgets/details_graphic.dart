import 'package:flutter/material.dart';

class DetailsGraphic extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onTap;
  const DetailsGraphic({
    Key? key,
    required this.title,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 200,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Text(
                title,
                style: theme.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              FittedBox(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
