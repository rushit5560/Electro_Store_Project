import 'dart:convert';

import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/collection_screen_model/collection_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CollectionScreenController extends GetxController {
 /* List<CollectionModel> collectionList = [
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
  ];*/

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum1> collectionLists = [];

  @override
  void onInit() {
    getCollectionData();
    super.onInit();
  }

  getCollectionData() async {
    isLoading(true);
    String url = ApiUrl.ProductApi;
    print('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      ProductData productData = ProductData.fromJson(json.decode(response.body));
      isStatus = productData.success.obs;

      if(isStatus.value) {
        collectionLists = productData.data;
      } else {
        print('Collection False False');
      }
    } catch(e) {
      print('Collection Error : $e');
    } finally {
      isLoading(false);
    }
  }
}