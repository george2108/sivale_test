import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/pick_image.service.dart';
import 'title_section_widget.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  XFile? photo;

  _pickPhoto() async {
    photo = await PickImageService().getImage(ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSectionWidget(title: 'Cámara'),
        FilledButton.icon(
          label: const Text('Tomar foto'),
          icon: const Icon(Icons.camera),
          onPressed: _pickPhoto,
        ),
        if (photo == null) Image.asset('assets/no-photo.jpg'),
        if (photo != null) Image.file(File(photo!.path)),
      ],
    );
  }
}
