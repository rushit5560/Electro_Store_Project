import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/collection_screen_controller/collection_screen_controller.dart';
import 'package:electro_store/models/collection_screen_model/collection_model.dart';
import 'package:electro_store/screens/product_details_screen/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionListModule extends StatelessWidget {
  // const CollectionListModule({Key? key}) : super(key: key);
  CollectionScreenController collectionScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    collectionScreenController.isLoading.value
        ? CustomCircularProgressIndicator() :
       Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: collectionScreenController.collectionLists.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7
          ),
          itemBuilder: (context, index){
           // CollectionModel collectionItem= collectionScreenController.collectionList[index];
            return _collectionListTile(index);
          },
        ),
      ),
    );
  }

  Widget _collectionListTile(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(
              () => ProductDetailsScreen(),
          arguments:
          collectionScreenController.collectionLists[index].id,
        );
      },
      child: Container(
        child: Column(
          children: [
            _imageModule(index),
            const SizedBox(height: 5),
            _titleAndPriceModule(index),
          ],
        ),
      ),
    );
  }

  Widget _imageModule(index) {
    return Expanded(
      flex: 80,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(ApiUrl.ApiMainPath +
                  "${collectionScreenController.collectionLists[index].showimg}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleAndPriceModule(index) {
    return Expanded(
      flex: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            collectionScreenController.collectionLists[index].productname,
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                collectionScreenController.collectionLists[index].productcost,
                style: TextStyle(
                  color: AppColors.kPinkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                  collectionScreenController.collectionLists[index].productcost,
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
}
