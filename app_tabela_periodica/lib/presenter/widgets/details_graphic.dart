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
    final media = MediaQuery.of(context);
    return Card(
      child: Container(
        width: media.size.width >= 690 ? 210 : double.maxFinite,
        height: media.size.width >= 690 ? 210 : null,
        padding: const EdgeInsets.all(10),
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
