import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SectionContainer({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headline5,
        ),
        const SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: children,
          ),
        ),
      ],
    );
  }
}
