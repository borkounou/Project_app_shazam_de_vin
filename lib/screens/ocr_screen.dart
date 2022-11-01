// import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../utils/dimensions.dart';

class OcrPageScreen extends StatefulWidget {
  const OcrPageScreen({Key? key}) : super(key: key);

  @override
  State<OcrPageScreen> createState() => _OcrPageScreenState();
  // _OcrPageScreenState createState() => _OcrPageScreenState();

}

class _OcrPageScreenState extends State<OcrPageScreen> {
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

    setState(() {
      selectedImage;
    });
  }

  Future getImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedFile!.path);

    setState(() {
      selectedImage;
    });
  }

  getImageFromServer() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/upload"));
    print(response.body);
    var decoded = json.decode(response.body) as Map<String, dynamic>;
    // print(decoded["image"]);
    // print(decoded["price"]);
    // print(decoded['description']);
    // _bytes = const Base64Decoder().convert(decoded["image"]);
    _bytes = const Base64Decoder().convert(decoded["image"]);
    // print(_bytes);
    setState(() {
      img = Image.memory(_bytes!);
    });
    // print(img);
    // return img;
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: Dimensions.positionHeightContainer370,
                    width: Dimensions.searcherContainerWidth200,
                    child: Center(
                      child: selectedImage == null
                          ? const Text("Please pick an Image to upload")
                          : Image.file(selectedImage!),
                    ),
                  ),
                  TextButton.icon(
                    onLongPress: () {},
                    onPressed: () {
                      uploadImage();
                      // setState(() {});
                    },
                    icon: const Icon(
                      Icons.upload_file,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Upload',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.teal,
                    height: Dimensions.positionHeightContainer370,
                    width: Dimensions.searcherContainerWidth200,
                    child: img,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      getImageFromServer();
                    },
                    icon: const Icon(
                      Icons.get_app,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'press',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          TextButton.icon(
            onLongPress: () {
              getImageFromGallery();
              setState(() {});
            },
            onPressed: () {
              getImageFromGallery();
              setState(() {});
            },
            icon: const Icon(
              Icons.camera,
              color: Colors.white,
            ),
            label: const Text(
              'image',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// isUploadImage
// ? (Container(
// color: Colors.blue,
// height: Dimensions.searcherContainerHeight300,
// width: Dimensions.searcherContainerWidth200,
// child: img,
// ))
// : (selectedImage == null
// ? const Text("Please pick an Image to upload")
// : Image.file(selectedImage!)),
//
// // Container(
// //   color: Colors.blue,
// //   height: 200,
// //   width: 200,
// //   child: img,
// // ),
// // selectedImage == null
// //     ? const Text("Please pick an Image to upload")
// //     : Image.file(selectedImage!),
// TextButton.icon(
// onPressed: () {
// uploadImage();
// setState(() {});
// },
// icon: const Icon(
// Icons.upload_file,
// color: Colors.white,
// ),
// label: const Text(
// 'Upload',
// style: TextStyle(color: Colors.white),
// ),
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.blue)),
// ),
// Row(
// children: [
// GestureDetector(
// onTap: () {
// getImageFromServer();
// setState(() {});
// },
// child: Container(
// width: Dimensions.screenWidth / 2.74,
// height: Dimensions.height50,
// decoration: BoxDecoration(
// color: Colors.tealAccent,
// borderRadius: BorderRadius.circular(Dimensions.radius20),
// ),
// child: const Center(
// child: Text("Press me"),
// ),
// ),
// ),
// ],
// )
// ],
// ),

// Scaffold(
// body: Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage("./wines/background.jpg"),
// fit: BoxFit.cover,
// ),
// ),
// child: Column(
// children: [
// const SizedBox(
// width: 100,
// ),
// Expanded(
// child: Container(
// height: 300,
// width: double.infinity,
// margin: const EdgeInsets.only(top: 70),
// padding: const EdgeInsets.only(left: 28, bottom: 5, right: 18),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15.0),
// image: const DecorationImage(
// image: AssetImage("./wines/bckgr_white.jpg"),
// fit: BoxFit.cover),
// ),
// child: const SingleChildScrollView(
// child: Padding(
// padding: EdgeInsets.all(12.0),
// child: Text(
// "ok",
// style: TextStyle(fontSize: 16.0),
// textAlign: TextAlign.justify,
// ),
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// margin: const EdgeInsets.only(top: 20, right: 140),
// child: Stack(
// children: [
// Stack(
// children: [
// Center(
// child: Image.asset(
// "./wines/pin.png",
// height: 240,
// width: 240,
// )),
// ],
// ),
// Center(
// child: TextButton(
// onPressed: () {
// getImageFromGallery();
// },
// onLongPress: () {
// getImage();
// },
// child: Container(
// margin: const EdgeInsets.only(top: 25),
// child:
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// );
