import 'package:carousel_slider/carousel_slider.dart';
import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/common/custom_drawer.dart';
import 'package:electro_store/controller/home_screen_controller/home_screen_controller.dart';
import 'package:electro_store/models/home_screen_model/featured_product_model.dart';
import 'package:electro_store/screens/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchFieldController = TextEditingController();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule('Home',1),
      endDrawer: CustomDrawer(),

      body: Stack(
        children: [
          ScreenBackground(),
          Obx(
            () => homeScreenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          _searchField(),
                          const SizedBox(height: 25),
                          _banner(),
                          carouselIndicator(),
                          const SizedBox(height: 10),
                          // _categoryList(),
                          const SizedBox(height: 10),
                          _newArrival(),
                          const SizedBox(height: 10),
                          _bestSeller(),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return TextFormField(
      controller: searchFieldController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            print('Search Text : ${searchFieldController.text.trim().toLowerCase()}');
            searchFieldController.clear();
          },
          icon: Icon(Icons.search_rounded, color: AppColors.kPinkColor),
        ),
      ),
    );
  }

  Widget _banner() {
    return Obx(
          ()=> CarouselSlider.builder(
        itemCount: homeScreenController.bannerLists.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = ApiUrl.ApiMainPath + '${homeScreenController.bannerLists[index].imagePath}';
          return buildImage(imgUrl, index);
        },
        options: CarouselOptions(
            height: Get.width * 0.3,
            autoPlay: true,
            viewportFraction: 1,

            onPageChanged: (index, reason) {
                homeScreenController.activeIndex.value = index;
            }),
      ),
    );
  }
  //Carousel Slider Image
  Widget buildImage(String urlImage, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: Get.width * 0.3,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('${AppImages.ic_banner_img}'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            left: 15,
            child: Container(
              width: Get.width * 0.30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Headphone',
                    textScaleFactor: 1.3,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      print('Shop Now');
                    },
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselIndicator() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeScreenController.bannerLists.length,
              (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: homeScreenController.activeIndex.value == index
                  ? AppColors.kPinkColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }


  // Widget _categoryList() {
  //   return GridView.builder(
  //     itemCount: homeScreenController.categoryList.length,
  //     shrinkWrap: true,
  //     physics: BouncingScrollPhysics(),
  //     scrollDirection: Axis.vertical,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 10,
  //       crossAxisSpacing: 10,
  //         childAspectRatio: 0.7,
  //     ),
  //     itemBuilder: (context, index){
  //       return Container(
  //         child: Column(
  //           children: [
  //             Expanded(
  //               flex: 75,
  //               child: Material(
  //                 borderRadius: BorderRadius.circular(10),
  //                 elevation: 10,
  //                 child: Container(
  //                   width: Get.width,
  //                   height: Get.height,
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: Padding(
  //                     padding: EdgeInsets.all(20),
  //                     child: Image.asset(
  //                         '${homeScreenController.categoryList[index].img}'
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               flex: 25,
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 8),
  //                 child: Text(
  //                   '${homeScreenController.categoryList[index].name}',
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _newArrival() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Arrival',
          textScaleFactor: 1.3,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Container(
          height: 160,
          child: GridView.builder(
            itemCount: homeScreenController.featuredProductLists.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index){
              Datum1 collectionItem = homeScreenController.featuredProductLists[index];
              return Container(
                child: GestureDetector(
                  onTap: () {
                    print('$index');
                    Get.to(
                      () => ProductDetailsScreen(),
                      arguments:
                          homeScreenController.featuredProductLists[index].id,
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        _imageModule('${ApiUrl.ApiMainPath}${collectionItem.showimg}'),
                        const SizedBox(height: 5),
                        _titleAndPriceModule(collectionItem),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // New Arrival Module
  Widget _imageModule(String img) {
    return Expanded(
      flex: 75,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('$img'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
  // New Arrival Module
  Widget _titleAndPriceModule(Datum1 collectionItem) {
    return Expanded(
      flex: 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${collectionItem.productname}',
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$${collectionItem.productcost}',
                style: TextStyle(
                  color: AppColors.kPinkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                '\$${collectionItem.productcost}',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bestSeller() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Seller',
          textScaleFactor: 1.3,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Container(
          height: 160,
          child: GridView.builder(
            itemCount: homeScreenController.featuredProductLists.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index){
              Datum1 collectionItem = homeScreenController.featuredProductLists[index];
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                          () => ProductDetailsScreen(),
                      arguments:
                      homeScreenController.featuredProductLists[index].id,
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        _imageModule('${ApiUrl.ApiMainPath}${collectionItem.showimg}'),
                        const SizedBox(height: 5),
                        _titleAndPriceModule(collectionItem),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
