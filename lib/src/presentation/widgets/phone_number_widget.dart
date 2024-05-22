import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'title_section_widget.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  String phoneNumber = '';

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSectionWidget(title: 'Número telefónico'),
        if (phoneNumber.isNotEmpty)
          Text('Número telefónico capturado: $phoneNumber'),
        const SizedBox(height: 10),
        TextField(
          controller: phoneNumberController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          onChanged: (value) => setState(() {
            phoneNumber = value;
          }),
          decoration: InputDecoration(
            label: const Text('Número telefónico'),
            hintText: 'Capturar número telefónico',
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
