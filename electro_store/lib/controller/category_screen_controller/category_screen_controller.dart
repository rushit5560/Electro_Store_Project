import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/category_screen_model/category_model.dart';
import 'package:get/get.dart';

class CategoryScreenController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(img: '${AppImages.ic_category1_img}',name: 'Mobile'),
    CategoryModel(img: '${AppImages.ic_category2_img}',name: 'Laptop'),
    CategoryModel(img: '${AppImages.ic_category3_img}',name: 'Headphone'),
    CategoryModel(img: '${AppImages.ic_category4_img}',name: 'Speaker'),
    CategoryModel(img: '${AppImages.ic_category5_img}',name: 'Washing Machine'),
    CategoryModel(img: '${AppImages.ic_category6_img}',name: 'Camera'),
    CategoryModel(img: '${AppImages.ic_category7_img}',name: 'Drone'),
    CategoryModel(img: '${AppImages.ic_category8_img}',name: 'Security Camera'),
    CategoryModel(img: '${AppImages.ic_category9_img}',name: 'Plug'),
  ];
}