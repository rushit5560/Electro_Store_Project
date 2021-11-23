import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/category_screen_model/category_model.dart';
import 'package:electro_store/models/collection_screen_model/collection_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(img: '${AppImages.ic_category1_img}',name: 'Mobile'),
    CategoryModel(img: '${AppImages.ic_category2_img}',name: 'Laptop'),
    CategoryModel(img: '${AppImages.ic_category3_img}',name: 'Headphone'),
    CategoryModel(img: '${AppImages.ic_category4_img}',name: 'Speaker'),
    CategoryModel(img: '${AppImages.ic_category5_img}',name: 'Washing Machine'),
    CategoryModel(img: '${AppImages.ic_category6_img}',name: 'Camera'),
    CategoryModel(img: '${AppImages.ic_category7_img}',name: 'Drone'),
    CategoryModel(img: '${AppImages.ic_category8_img}',name: 'Security Camera'),
    // CategoryModel(img: '${AppImages.ic_category9_img}',name: 'Plug'),
  ];

  List<CollectionModel> newArrivalList = [
    CollectionModel(
      img: '${AppImages.ic_collection1_img}',
      title: 'Maecenas porttitor quis asa sa',
      activePrice: '200',
      inActivePrice: '210',
    ),
    CollectionModel(
      img: '${AppImages.ic_collection2_img}',
      title: 'Maecenas porttitor quis',
      activePrice: '200',
      inActivePrice: '210',
    ),
    CollectionModel(
      img: '${AppImages.ic_collection3_img}',
      title: 'Maecenas porttitor quis',
      activePrice: '200',
      inActivePrice: '210',
    ),
    CollectionModel(
      img: '${AppImages.ic_collection4_img}',
      title: 'Maecenas porttitor quis',
      activePrice: '200',
      inActivePrice: '210',
    ),
    CollectionModel(
      img: '${AppImages.ic_collection5_img}',
      title: 'Maecenas porttitor quis',
      activePrice: '200',
      inActivePrice: '210',
    ),
    CollectionModel(
      img: '${AppImages.ic_collection6_img}',
      title: 'Maecenas porttitor quis',
      activePrice: '200',
      inActivePrice: '210',
    ),
  ];
}