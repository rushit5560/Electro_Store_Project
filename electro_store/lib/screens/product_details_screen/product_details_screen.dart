import 'package:carousel_slider/carousel_slider.dart';
import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  // const ProductDetailsScreen({Key? key}) : super(key: key);
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsScreenController productDetailsScreenController = Get.put(ProductDetailsScreenController());
  TextEditingController reviewFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Obx(
        () => productDetailsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Stack(
                children: [
                  ScreenBackground(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _productImgModule(),
                        _productDetails(),
                        _rating(),
                        _giveReview(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _productImgModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 12),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            carouselSlider(),
            Positioned(
              bottom: 5,
              child: carouselIndicator(),
            ),
          ],
        ),
      ),
    );
  }
  // Use _productImgModule
  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productDetailsScreenController.productDetailLists[0].images.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                    ApiUrl.ApiMainPath + "${productDetailsScreenController.productDetailLists[0].images[index]}"),
                fit: BoxFit.cover,
              )
          ),
        );
      },
      options: CarouselOptions(
          height: Get.height * 0.40,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
                productDetailsScreenController.activeIndex.value = index;
          }),
    );
  }
  Widget carouselIndicator() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          productDetailsScreenController.productDetailLists[0].images.length,
              (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: productDetailsScreenController.activeIndex.value == index
                  ? AppColors.kPinkColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name & Fav Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${productDetailsScreenController.productDetailLists[0].productname}',
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPinkColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          // Price Module
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$${productDetailsScreenController.productDetailLists[0].productcost}',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: AppColors.kPinkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '\$${productDetailsScreenController.productDetailLists[0].productcost}',
                textScaleFactor: 1.2,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Rating Module
          RatingBar.builder(
            itemCount: 5,
            ignoreGestures: true,
            unratedColor: AppColors.kLightOrangeColor,
            allowHalfRating: true,
            itemSize: 18,
            minRating: 1,
            glow: false,
            initialRating: 3,
            itemBuilder: (context, _) {
              return Icon(
                Icons.star_rounded,
                color: AppColors.kOrangeColor,
              );
            },
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 5),
          //Product Description
          Text(
            '${productDetailsScreenController.productDetailLists[0].fullText}',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),

          Text(
            'Color',
            style: TextStyle(
                color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 20,
            width: Get.width * 0.45,
            // alignment: Alignment.centerRight,
            child: ListView.builder(
              itemCount: productDetailsScreenController.colorList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        productDetailsScreenController.activeColor.value = index;
                        print(productDetailsScreenController.activeColor.value);
                      });
                    },
                    child: Container(
                      padding: productDetailsScreenController.activeColor.value == index ?  EdgeInsets.all(2) : EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 20, height: 20,
                        decoration: BoxDecoration(
                            color: productDetailsScreenController.colorList[index],
                            shape: BoxShape.circle
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _rating() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review',
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Get.width * 0.15,
                            height: Get.width * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('${AppImages.ic_profile_img}'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jenny Doe',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Rating Module
                                      RatingBar.builder(
                                        itemCount: 5,
                                        ignoreGestures: true,
                                        unratedColor: AppColors.kLightOrangeColor,
                                        allowHalfRating: true,
                                        itemSize: 18,
                                        minRating: 1,
                                        glow: false,
                                        initialRating: 4.5,
                                        itemBuilder: (context, _) {
                                          return Icon(
                                            Icons.star_rounded,
                                            color: AppColors.kOrangeColor,
                                          );
                                        },
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '20 Dec 2019',
                                    textScaleFactor: 0.9,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'Present Faucibus elementum nisl Present Faucibus elementum nisl Present ',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _giveReview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Give Review',
            textScaleFactor: 1.3,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RatingBar.builder(
            itemCount: 5,
            // ignoreGestures: true,
            unratedColor: AppColors.kLightOrangeColor,
            allowHalfRating: true,
            itemSize: 18,
            minRating: 1,
            glow: false,
            initialRating: 0,
            itemBuilder: (context, _) {
              return Icon(
                Icons.star_rounded,
                color: AppColors.kOrangeColor,
              );
            },
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: reviewFieldController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Comment',

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.kPinkColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
