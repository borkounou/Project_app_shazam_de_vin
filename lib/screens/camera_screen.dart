import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shazam_vin_project/screens/wine_searcher_result_screen.dart';

import '../utils/app_styles.dart';
import '../utils/dimensions.dart';
import '../widgets/bigText.dart';
import '../widgets/button_build.dart';
import 'package:http/http.dart' as http;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _bytes;
  bool isUploadImage = true;
  Image? img;
  File? selectedImage;
  String message = "";
  bool stateImage = true;

  Future getImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    selectedImage = File(pickedFile!.path);

    if (pickedFile == null) return;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WineSearchResult(image: pickedFile)));

    setState(() {
      selectedImage;
    });
    uploadImage();
  }

  Future getImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedFile!.path);

    if (pickedFile == null) return;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WineSearchResult(
              image: pickedFile,
            )));

    setState(() {
      selectedImage;
    });
    uploadImage();
  }

  getImageFromServer() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/upload"));
    // if (response.statusCode == 200) {
    var decoded = json.decode(response.body) as Map<String, dynamic>;
    print(decoded);

    _bytes = const Base64Decoder().convert(decoded["image"]);
    setState(() {
      img = Image.memory(_bytes!);
    });
    // }
    // print(_bytes);
  }

  uploadImage() async {
    final request =
        http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/upload"));

    final headers = {"Content-type": "multipart/form-data"};

    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson["message"];
    getImageFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StylesApp.primaryColor,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: Dimensions.imgConMarginTop200 - Dimensions.radius50,
            child: CircleAvatar(
              radius: Dimensions.imgConMarginTop200 - Dimensions.radius50,
              backgroundColor: StylesApp.primaryColor,
              child: ClipOval(
                child: (selectedImage != null)
                    ? Image.file(selectedImage!)
                    : Image.asset('./wines/bckgr_white.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigText(
            text: "Pick an image",
            color: Colors.white,
            size: Dimensions.font26,
          ),
          SizedBox(height: Dimensions.height20),
          BuildButton(
            func: getImageFromGallery,
            icon: Icons.image,
            buttonTitle: 'Pick from gallery',
            color: Colors.white,
          ),
          SizedBox(height: Dimensions.height20),
          BuildButton(
            func: getImage,
            icon: Icons.camera_alt,
            buttonTitle: 'Pick from camera',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
