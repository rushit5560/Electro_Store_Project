import 'dart:convert';

import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/models/category_screen_model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryScreenController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> categoryLists = [];

  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }

  getCategoryData() async {
    isLoading(true);
    String url = ApiUrl.CategoryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      CategoryData categoryData = CategoryData.fromJson(json.decode(response.body));
      isStatus = categoryData.success.obs;

      if(isStatus.value){
        categoryLists = categoryData.data;
      } else {
        print('Category False False');
      }
    } catch(e) {
      print('Category Data Error : $e');
    } finally {
      isLoading(false);
    }
  }
}