import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/collection_screen_model/collection_model.dart';
import 'package:get/get.dart';

class CollectionScreenController extends GetxController {
  List<CollectionModel> collectionList = [
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