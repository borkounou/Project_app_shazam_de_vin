import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';
import 'package:shazam_vin_project/utils/dimensions.dart';

import '../data_models/models.dart';
import '../widgets/bigText.dart';
import '../widgets/smallText.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);

  PageController pageController2 =
      PageController(viewportFraction: 0.25, initialPage: 4);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.firstMainContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  // Dispose it means if we leave the page we don't want it to be active: otherwise there will be memory leak;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wine = wines;
    return Column(
      children: [
        SizedBox(
          height: Dimensions.firstMainContainer,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                ),
                color: Colors.orangeAccent,
                height: Dimensions.secondMainContainer,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, color: Colors.white),
                        SizedBox(width: Dimensions.width10),
                        BigText(
                            text: "Wine Shop",
                            size: Dimensions.font26,
                            color: Colors.white),
                        SizedBox(width: Dimensions.width10),
                        const Icon(Icons.shopping_cart, color: Colors.white)
                      ],
                    ),
                    SizedBox(height: Dimensions.width20),
                    Container(
                      decoration: BoxDecoration(
                          color: StylesApp.container2Color,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30)),
                      padding: EdgeInsets.only(
                        left: Dimensions.width5,
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_search_regular,
                            color: StylesApp.textColor1,
                          ),
                          SizedBox(width: Dimensions.width10),
                          SmallText(
                            text: "search",
                            color: Colors.white,
                            size: Dimensions.iconSize16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: wine.length,
                  itemBuilder: (context, position) {
                    final Wine wineBrand = wine[position];
                    return _buildPageItem(position, wineBrand);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        DotsIndicator(
          dotsCount: wine.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: StylesApp.primaryColor,
            size: Size.square(Dimensions.height10 - 1),
            activeSize: Size(Dimensions.height20 - 2, Dimensions.height10 - 1),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15 / 5)),
          ),
        ),
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width5,
            right: Dimensions.width5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Popular",
                color: StylesApp.primaryColor,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(Dimensions.height10),
                child: SmallText(
                  text: "See all",
                  color: StylesApp.primaryColor,
                  size: Dimensions.iconSize16,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height5),
        ListView.builder(
            itemCount: wine.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, position) {
              final Wine wineBrand = wine[position];
              return Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height20,
                ),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.popularImgWidth,
                      height: Dimensions.popularImgHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            wineBrand.imagePath,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.popularImgHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BigText(
                                text: wineBrand.title,
                                color: StylesApp.textColor3,
                              ),
                              SmallText(
                                text: wineBrand.price,
                                color: StylesApp.primaryColor,
                                size: Dimensions.font16,
                              ),
                              // SizedBox(height: Dimensions.height10),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      wineBrand.rating,
                                      (index) => Icon(
                                          FluentSystemIcons
                                              .ic_fluent_star_filled,
                                          color: StylesApp.starColor,
                                          size: Dimensions.iconSize16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index, final Wine wineBrand) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.width5,
          right: Dimensions.width5,
          top: Dimensions.imgConMarginTop200,
          bottom: Dimensions.height10,
        ),
        padding: EdgeInsets.only(
          left: Dimensions.width5,
          right: Dimensions.width5,
          bottom: Dimensions.height20,
          top: Dimensions.height20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: StylesApp.container1Color,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(wineBrand.title, style: StylesApp.textStyle2),
                  SizedBox(height: Dimensions.height10),
                  Text(wineBrand.price, style: StylesApp.priceStyle),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          wineBrand.rating,
                          (index) => Icon(
                            FluentSystemIcons.ic_fluent_star_filled,
                            color: StylesApp.starColor,
                            size: Dimensions.iconSize16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  Text("Made in ${wineBrand.countryOfOrigin}",
                      style: StylesApp.textStyle4),
                ],
              ),
            ),
            Container(
              width: Dimensions.imageContainerWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    wineBrand.imagePath,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
