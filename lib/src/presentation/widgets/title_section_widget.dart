import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;

  const TitleSectionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(),
      ],
    );
  }
}
