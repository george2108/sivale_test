import 'package:flutter/material.dart';

import 'title_section_widget.dart';

class SexWidget extends StatefulWidget {
  const SexWidget({super.key});

  @override
  State<SexWidget> createState() => _SexWidgetState();
}

class _SexWidgetState extends State<SexWidget> {
  String sex = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSectionWidget(title: 'Elegir Sexo'),
        if (sex.isNotEmpty) Text('El sexo elegido es: $sex'),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: sex,
            onChanged: (value) {
              if (value == null) return;

              sex = value;
              setState(() {});
            },
            items: const [
              DropdownMenuItem(
                value: 'Masculino',
                child: Text('Masculino'),
              ),
              DropdownMenuItem(
                value: 'Femenino',
                child: Text('Femenino'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
