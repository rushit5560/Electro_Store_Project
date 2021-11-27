import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/category_screen_controller/category_screen_controller.dart';
import 'package:electro_store/models/category_screen_model/category_model.dart';
import 'package:electro_store/screens/collection_screen/collection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListModule extends StatelessWidget {
  CategoryScreenController categoryScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => categoryScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GridView.builder(
                      itemCount: categoryScreenController.categoryLists.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        Datum categoryItem =
                            categoryScreenController.categoryLists[index];
                        return _categoryListTile(categoryItem);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _categoryListTile(Datum categoryItem) {
    return GestureDetector(
      onTap: () {
        print('${categoryItem.categoryName}');
        Get.to(()=> CollectionScreen());
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                        ApiUrl.ApiMainPath + '${categoryItem.showimg}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${categoryItem.categoryName}',
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
