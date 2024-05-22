import 'package:image_picker/image_picker.dart';

class PickImageService {
  static final PickImageService _singleton = PickImageService._();
  PickImageService._();
  factory PickImageService() {
    return _singleton;
  }

  Future<XFile?> getImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: source,
    );

    return image;
  }
}
