import 'dart:convert';
import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/home_screen_model/banner_model.dart';
import 'package:electro_store/models/home_screen_model/featured_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  RxInt activeIndex = 0.obs;
  RxList<Datum> bannerLists = RxList();
  RxList<Datum1> featuredProductLists = RxList();



  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      isLoading(false);
    }
    getFeaturedProductData();
  }

  getFeaturedProductData() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      FeaturedProductData featuredProductData = FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;

      if(isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      isLoading(false);
    }
  }

  // List<CategoryModel> categoryList = [
  //   CategoryModel(img: '${AppImages.ic_category1_img}',name: 'Mobile'),
  //   CategoryModel(img: '${AppImages.ic_category2_img}',name: 'Laptop'),
  //   CategoryModel(img: '${AppImages.ic_category3_img}',name: 'Headphone'),
  //   CategoryModel(img: '${AppImages.ic_category4_img}',name: 'Speaker'),
  //   CategoryModel(img: '${AppImages.ic_category5_img}',name: 'Washing Machine'),
  //   CategoryModel(img: '${AppImages.ic_category6_img}',name: 'Camera'),
  //   CategoryModel(img: '${AppImages.ic_category7_img}',name: 'Drone'),
  //   CategoryModel(img: '${AppImages.ic_category8_img}',name: 'Security Camera'),
  //   // CategoryModel(img: '${AppImages.ic_category9_img}',name: 'Plug'),
  // ];

  // List<CollectionModel> newArrivalList = [
  //   CollectionModel(
  //     img: '${AppImages.ic_collection1_img}',
  //     title: 'Maecenas porttitor quis asa sa',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  //   CollectionModel(
  //     img: '${AppImages.ic_collection2_img}',
  //     title: 'Maecenas porttitor quis',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  //   CollectionModel(
  //     img: '${AppImages.ic_collection3_img}',
  //     title: 'Maecenas porttitor quis',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  //   CollectionModel(
  //     img: '${AppImages.ic_collection4_img}',
  //     title: 'Maecenas porttitor quis',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  //   CollectionModel(
  //     img: '${AppImages.ic_collection5_img}',
  //     title: 'Maecenas porttitor quis',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  //   CollectionModel(
  //     img: '${AppImages.ic_collection6_img}',
  //     title: 'Maecenas porttitor quis',
  //     activePrice: '200',
  //     inActivePrice: '210',
  //   ),
  // ];


  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }
}