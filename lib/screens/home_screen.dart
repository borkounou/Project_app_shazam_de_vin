import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';
import 'package:shazam_vin_project/utils/dimensions.dart';

import '../data_models/models.dart';

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
        // print("Current value is " + _currentPageValue.toString());
      });
    });
  }

  // Dispose it means if we leave the page we don't want it to be active: otherwise there will be memory leak;
  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final wine = wines;
    return Column(
      children: [
        Container(
          height: Dimensions.firstMainContainer,
          // color: Colors.red,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                color: Colors.orangeAccent,
                height: Dimensions.secondMainContainer,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, color: Colors.white),
                        Gap(Dimensions.width10),
                        const Text("Wine Shope",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Gap(Dimensions.width10),
                        const Icon(Icons.shopping_cart, color: Colors.white)
                      ],
                    ),
                    Gap(Dimensions.width10),
                    Container(
                      decoration: BoxDecoration(
                          color: StylesApp.container2Color,
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_search_regular,
                            color: StylesApp.textColor1,
                          ),
                          Gap(Dimensions.width10),
                          Text("search", style: StylesApp.searchStyle),
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
                    final Wine winebrand = wine[position];
                    return _buildPageItem(position, winebrand);
                  },
                ),
              ),
            ],
          ),
        ),
        Gap(Dimensions.height10),
        DotsIndicator(
          dotsCount: wine.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: StylesApp.primaryColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Gap(Dimensions.height20),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: StylesApp.header2,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Text("See all", style: StylesApp.textStyle3),
                onTap: () {},
              ),
            ],
          ),
        ),
        Gap(Dimensions.height5),
        Container(
          height: Dimensions.popularImageContainer,
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: PageView.builder(
            controller: pageController2,
            itemCount: wine.length,
            itemBuilder: (context, position) {
              final Wine winebrand = wine[position];
              return Container(
                margin: const EdgeInsets.only(top: 2, left: 5, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: StylesApp.container2Color,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(winebrand.imagePath),
                    )),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index, final Wine winebrand) {
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
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: StylesApp.container1Color,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(winebrand.title, style: StylesApp.textStyle2),
                // const SizedBox(height: 10),
                Gap(Dimensions.height10),
                Text(winebrand.price, style: StylesApp.priceStyle),
                // const SizedBox(height: 10),
                Gap(Dimensions.height10),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        winebrand.rating,
                        (index) => Icon(FluentSystemIcons.ic_fluent_star_filled,
                            color: StylesApp.starColor, size: 15),
                      ),
                    ),
                  ],
                ),
                Gap(Dimensions.height10),
                Text("Made in ${winebrand.countryOfOrigin}",
                    style: StylesApp.textStyle4),
              ],
            ),
            Image.asset(winebrand.imagePath),
          ],
        ),
      ),
    );
  }
}
