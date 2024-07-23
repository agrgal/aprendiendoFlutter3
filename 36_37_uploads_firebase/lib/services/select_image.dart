import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage() async {

  final ImagePicker picker = ImagePicker(); // instancia de ImagePicker
  final XFile? image = await picker.pickImage(
    source: ImageSource.camera, 
    );
  return image;

}