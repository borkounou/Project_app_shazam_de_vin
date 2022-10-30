import 'package:flutter/material.dart';
import 'package:shazam_vin_project/utils/app_styles.dart';
import 'package:shazam_vin_project/widgets/bigText.dart';

import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';
import '../widgets/textExpandableWidget.dart';

class SearchScreenDetail extends StatefulWidget {
  const SearchScreenDetail({Key? key}) : super(key: key);

  @override
  State<SearchScreenDetail> createState() => _SearchScreenDetailState();
}

class _SearchScreenDetailState extends State<SearchScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.clear,
                  size: Dimensions.iconSize16,
                  color: StylesApp.primaryColor,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: Dimensions.iconSize16,
                  color: StylesApp.primaryColor,
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: BigText(
                    text: "Titre the vin",
                    size: Dimensions.font16,
                  ),
                ),
              ),
            ),
            backgroundColor: StylesApp.starColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "./wines/background.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: const ExpandableTextWidget(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                          " It has survived not only five centuries, but also the leap into electronic typesetting, "
                          "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset "
                          "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
                          "Aldus PageMaker including versions of Lorem Ipsum."
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                          " It has survived not only five centuries, but also the leap into electronic typesetting, "
                          "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset "
                          "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
                          "Aldus PageMaker including versions of Lorem Ipsum.",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppICon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: StylesApp.primaryColor,
                ),
                BigText(
                  text: " \$ 20\t X  0 ",
                  color: Colors.black,
                  size: Dimensions.font26,
                ),
                AppICon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: StylesApp.primaryColor,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: StylesApp.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    right: Dimensions.width20,
                    left: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: StylesApp.primaryColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    right: Dimensions.width20,
                    left: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: StylesApp.primaryColor,
                  ),
                  child: BigText(
                    text: "\$ 10 | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
