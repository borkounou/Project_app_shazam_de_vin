import 'dart:convert';
import 'dart:typed_data';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shazam_vin_project/widgets/bigText.dart';
import 'dart:io';

import '../utils/app_styles.dart';
import '../utils/dimensions.dart';
import '../widgets/smallText.dart';

class WineSearchResult extends StatefulWidget {
  final XFile? image;
  // Map<String, dynamic>? receivedMap;
  const WineSearchResult({
    Key? key,
    this.image,
    // this.receivedMap,
  }) : super(key: key);

  @override
  State<WineSearchResult> createState() => _WineSearchResultState(image);
}

class _WineSearchResultState extends State<WineSearchResult> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _bytes;
  bool isUploadImage = true;
  Image? img;
  File? selectedImage;
  String message = "";
  bool stateImage = true;
  XFile? image;
  // Map<String, dynamic> receivedMap;

  _WineSearchResultState(this.image);

  @override
  Widget build(BuildContext context) {
    // print(receivedMap);
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
              height:
                  Dimensions.positionHeightContainer370 + Dimensions.height10,
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
                      borderRadius: BorderRadius.circular(Dimensions.height20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('./wines/background.jpg'),
                      ),
                    ),
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
            top: Dimensions.height30,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              height: Dimensions.searcherContainer270,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: Dimensions.radius100,
                child: CircleAvatar(
                  radius: Dimensions.radius100,
                  backgroundColor: StylesApp.container2Color,
                  child: ClipOval(
                    child: (image != null)
                        ? Image.file(File(image!.path))
                        : Image.asset('./wines/bckgr_white.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
