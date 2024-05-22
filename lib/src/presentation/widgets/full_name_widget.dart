import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'title_section_widget.dart';

class FullNameWidget extends StatefulWidget {
  const FullNameWidget({super.key});

  @override
  State<FullNameWidget> createState() => _FullNameWidgetState();
}

class _FullNameWidgetState extends State<FullNameWidget> {
  String fullname = '';

  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSectionWidget(title: 'Nombre completo'),
        if (fullname.isNotEmpty) Text('Nombre completo: $fullname'),
        const SizedBox(height: 10),
        TextField(
          controller: fullNameController,
          keyboardType: TextInputType.text,
          maxLength: 35,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
          ],
          onChanged: (value) => setState(() {
            fullname = value;
          }),
          decoration: InputDecoration(
            label: const Text('Nombre completo'),
            hintText: 'Nombre completo',
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}
