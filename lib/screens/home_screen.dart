import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';

import '../utils/app_layout.dart';

// class MyHomePage extends StatefulWidget {
//   // const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late PageController _pageController;
//   var activePage;
//   List<String> images = [
//     "./wines/wine_1.png",
//     "./wines/wine_2.png",
//     "./wines/wine_3.png",
//     "./wines/wine_7.png",
//     "./wines/wine_6.png"
//   ];
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       itemCount: images.length,
//       pageSnapping: true,
//       controller: _pageController,
//       onPageChanged: (page) {
//         setState(() {
//           activePage = page;
//         });
//       },
//       itemBuilder: (context, pagePosition) {
//         return Container(
//           margin: const EdgeInsets.all(10),
//           child: Image.asset(images[pagePosition]),
//         );
//       },
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _rating =1;
  // Widget _starRating(int rating){
  //
  //
  // }
  Widget _blockOfContainerIcon(final size) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      height: size.height * 0.3,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: StylesApp.container1Color,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Text("Red Wine", style: StylesApp.header2),
              const Gap(20),
              const Text("\$250.0"),
              const Gap(20),
              Row(
                children: [
                  Icon(FluentSystemIcons.ic_fluent_star_filled,
                      color: StylesApp.starColor),
                  Icon(FluentSystemIcons.ic_fluent_star_filled,
                      color: StylesApp.starColor),
                  Icon(FluentSystemIcons.ic_fluent_star_filled,
                      color: StylesApp.starColor),
                  Icon(FluentSystemIcons.ic_fluent_star_filled,
                      color: StylesApp.starColor),
                  Icon(FluentSystemIcons.ic_fluent_star_filled,
                      color: StylesApp.starColor),
                ],
              ),
              const Gap(20),
              Text("Made by France", style: StylesApp.textStyle2),
            ],
          ),

          Image.asset("./wines/wine_2.png"),
          // Image section
        ],
      ),
    );
  }

  _containerImage() {}
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          children: [
            const Gap(40),
            Container(
              width: size.width * 0.8,
              margin: const EdgeInsets.only(left: 16, right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: StylesApp.container2Color,
              ),
              child: Row(
                children: [
                  Icon(
                    FluentSystemIcons.ic_fluent_search_regular,
                    color: StylesApp.textColor1,
                  ),
                  const Gap(12),
                  Text(
                    "search",
                    style: StylesApp.searchStyle,
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              children: [
                _blockOfContainerIcon(size),
                const Gap(20),
                _blockOfContainerIcon(size),
                const Gap(20),
                _blockOfContainerIcon(size),
                const Gap(20),
                _blockOfContainerIcon(size),
                const Gap(20),
                _blockOfContainerIcon(size),
              ],
            ),
          ],
        )
      ],
    );
  }
}
