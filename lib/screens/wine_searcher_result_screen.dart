import 'dart:convert';
import 'dart:typed_data';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shazam_vin_project/widgets/bigText.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/app_styles.dart';
import '../utils/dimensions.dart';
import '../widgets/smallText.dart';

class WineSearchResult extends StatefulWidget {
  const WineSearchResult({Key? key}) : super(key: key);

  @override
  State<WineSearchResult> createState() => _WineSearchResultState();
}

class _WineSearchResultState extends State<WineSearchResult> {
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
    // print(response.body);
    var decoded = json.decode(response.body) as Map<String, dynamic>;
    // print(decoded["image"]);
    _bytes = const Base64Decoder().convert(decoded["image"]);
    print(_bytes);
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
    return Container(
      color: StylesApp.container2Color,
      child: Stack(
        // clipBehavior: Clip.none,
        children: [
          Positioned(
            top: Dimensions.positionTopHeight230,
            left: Dimensions.positionWidth80,
            right: Dimensions.positionWidth80,
            child: Container(
              margin: EdgeInsets.only(bottom: Dimensions.height10),
              height: Dimensions.positionHeightContainer370,
              width: Dimensions.positionWidthContainer400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    height: Dimensions.searcherContainer270,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('./wines/background.jpg'))),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: "2007 Villa Loren Valpolicella",
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          SmallText(
                            text: "France",
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(text: "\$20"),
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                      FluentSystemIcons.ic_fluent_star_filled,
                                      color: StylesApp.starColor,
                                      size: Dimensions.iconSize16),
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.deepOrange,
                                size: Dimensions.iconSize16,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          Positioned(
            left: Dimensions.positionWidth100,
            right: Dimensions.positionWidth100,
            top: Dimensions.height10,
            child: Container(
              height: Dimensions.searcherContainerHeight300,
              width: Dimensions.searcherContainerWidth200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('./wines/pin.png')),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
