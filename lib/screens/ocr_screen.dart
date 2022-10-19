import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageOCRPage extends StatefulWidget {
  const ImageOCRPage({Key? key}) : super(key: key);

  @override
  State<ImageOCRPage> createState() => _ImageOCRPageState();
}

class _ImageOCRPageState extends State<ImageOCRPage> {
  // initialize the package
  final ImagePicker _picker = ImagePicker();
  // pick an image from gallery
  XFile? image;

  pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    image = XFile(pickedFile!.path);
    setState(() {
      image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
