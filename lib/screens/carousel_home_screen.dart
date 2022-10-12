import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shazam_vin_project/data_models/models.dart';
import 'package:shazam_vin_project/utils/app_layout.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';

class MyCarouselPage extends StatefulWidget {
  const MyCarouselPage({Key? key}) : super(key: key);
  @override
  State<MyCarouselPage> createState() => _MyCarouselPageState();
}

class _MyCarouselPageState extends State<MyCarouselPage> {
  var activePage = 1;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  iconStart(int rating) {
    int i = 0;
    for (int i = 0; i < rating; i++) {
      return const Icon(FluentSystemIcons.ic_fluent_star_filled);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    final wine = wines;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Gap(50),
        Text(
          "Wine store: check",
          style: StylesApp.header1,
        ),
        const Gap(20),
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
        SizedBox(
          width: size.width,
          height: 200,
          child: PageView.builder(
            itemCount: wine.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              final Wine winebrand = wine[pagePosition];
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: const EdgeInsets.only(left: 16),
                // height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: StylesApp.container1Color,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(15),
                        Text(winebrand.title, style: StylesApp.textStyle2),
                        const Gap(15),
                        Text(
                          winebrand.price,
                          style: StylesApp.priceStyle,
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            // iconStart(winebrand.rating),
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
                        const Gap(15),
                        Text("Made in ${winebrand.countryOfOrigin}",
                            style: StylesApp.textStyle2),
                      ],
                    ),

                    Image.asset(winebrand.imagePath),
                    // Image section
                  ],
                ),
              );
            },
          ),
        ),
        const Gap(50),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: StylesApp.header1,
              ),
              InkWell(
                child: Text(
                  "See all",
                  style: StylesApp.textStyle1,
                ),
                onTap: () {
                  print("Work");
                },
              ),
            ],
          ),
        ),
        const Gap(10),
        SizedBox(
          width: size.width,
          height: 100,
          child: PageView.builder(
            itemCount: wine.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              final Wine winebrand = wine[pagePosition];
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: const EdgeInsets.only(left: 10),
                // height: size.height * 0.3,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: StylesApp.container2Color,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(15),
                        Text(winebrand.title, style: StylesApp.textStyle2),
                        const Gap(15),
                        Text(
                          winebrand.price,
                          style: StylesApp.priceStyle,
                        ),
                        const Gap(15),
                      ],
                    ),

                    Image.asset(
                      winebrand.imagePath,
                      height: 100,
                    ),
                    // Image section
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
