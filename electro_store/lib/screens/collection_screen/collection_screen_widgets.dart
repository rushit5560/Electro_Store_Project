import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/controller/collection_screen_controller/collection_screen_controller.dart';
import 'package:electro_store/models/collection_screen_model/collection_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionListModule extends StatelessWidget {
  // const CollectionListModule({Key? key}) : super(key: key);
  CollectionScreenController collectionScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: collectionScreenController.collectionList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7
        ),
        itemBuilder: (context, index){
          CollectionModel collectionItem= collectionScreenController.collectionList[index];
          return _collectionListTile(collectionItem, index);
        },
      ),
    );
  }

  Widget _collectionListTile(CollectionModel collectionItem, int index) {
    return GestureDetector(
      onTap: () {
        print('$index');
      },
      child: Container(
        child: Column(
          children: [
            _imageModule('${collectionItem.img}'),
            const SizedBox(height: 5),
            _titleAndPriceModule(collectionItem),
          ],
        ),
      ),
    );
  }

  Widget _imageModule(String img) {
    return Expanded(
      flex: 80,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('$img'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleAndPriceModule(CollectionModel collectionItem) {
    return Expanded(
      flex: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${collectionItem.title}',
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$200',
                style: TextStyle(
                  color: AppColors.kPinkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                '\$210',
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
