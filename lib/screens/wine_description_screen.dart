import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';
import 'package:shazam_vin_project/widgets/app_icon.dart';
import 'package:shazam_vin_project/widgets/bigText.dart';
import 'package:shazam_vin_project/widgets/smallText.dart';
import '../utils/dimensions.dart';
import '../widgets/textExpandableWidget.dart';

class WineDetailPage1 extends StatelessWidget {
  const WineDetailPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height30, left: Dimensions.width20),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: Dimensions.iconSize24,
                    color: StylesApp.primaryColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: Dimensions.width20,
                    top: Dimensions.height30,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: Dimensions.iconSize24,
                    color: StylesApp.primaryColor,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height50),
              height: Dimensions.secondMainContainer,
              child: Row(
                children: [
                  Container(
                    width: Dimensions.wineDetailContainer,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("./wines/wine_3.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.height5,
                  ),
                  // Container for the detail of the image
                  Container(
                    padding: EdgeInsets.only(bottom: Dimensions.height20),
                    width: Dimensions.wineDetailContainer,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Orange wine",
                          color: StylesApp.primaryColor,
                          size: Dimensions.font26,
                        ),
                        BigText(
                          text: "\$99.0",
                          color: StylesApp.primaryColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: "Year",
                              color: Colors.black54,
                              size: Dimensions.font16,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height5,
                                  right: Dimensions.width5),
                              child: SmallText(text: "2005"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              size: Dimensions.font16,
                              text: "Quantity",
                              color: Colors.black54,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height5,
                                    right: Dimensions.width5),
                                child: SmallText(text: "0.500ML")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              size: Dimensions.font16,
                              text: "Country",
                              color: Colors.black54,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height5,
                                    right: Dimensions.width5),
                                child: SmallText(text: "France")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              size: Dimensions.font16,
                              text: "Review",
                              color: Colors.black54,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height5,
                                  right: Dimensions.width5),
                              child: Wrap(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                      FluentSystemIcons.ic_fluent_star_filled,
                                      color: const Color(0xFFFccc7c5),
                                      size: Dimensions.iconSize16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.containerLongText,
              margin: EdgeInsets.only(top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20),
              )),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width10),
              child: const SingleChildScrollView(
                child: ExpandableTextWidget(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                        "when an unknown printer took a galley of type and scrambled it "
                        "to make a type specimen book. It has survived not only five centuries,"
                        " but also the leap into electronic typesetting, remaining essentially unchanged."
                        " It was popularised in the 1960s with the release of Letraset sheets containing Lorem "
                        "Ipsum passages, and more recently with desktop publishing software "
                        "like Aldus PageMaker including versions of Lorem Ipsum."
                        "like Aldus PageMaker including versions of Lorem Ipsum."),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Dimensions.bottomNavBarContainerHeight,
              width: Dimensions.containerWidth150,
              padding: EdgeInsets.only(
                left: Dimensions.height5,
                right: Dimensions.height5,
              ),
              margin: EdgeInsets.only(
                  left: Dimensions.height20,
                  bottom: Dimensions.width20,
                  top: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: StylesApp.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppICon(
                    icon: Icons.remove,
                    size: Dimensions.iconSize16,
                  ),
                  BigText(text: '0'),
                  AppICon(
                    icon: Icons.add,
                    size: Dimensions.iconSize16,
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomNavBarContainerHeight,
              width: Dimensions.containerWidth150,
              margin: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  bottom: Dimensions.width20,
                  top: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: StylesApp.primaryColor,
              ),
              child: Center(
                child: SmallText(
                  text: "Add to cart",
                  size: Dimensions.font12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
