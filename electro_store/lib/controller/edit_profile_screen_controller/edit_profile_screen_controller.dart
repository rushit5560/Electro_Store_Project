import 'dart:convert';

import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/models/edit_profile_screen_model/city_model.dart';
import 'package:electro_store/models/edit_profile_screen_model/country_model.dart';
import 'package:electro_store/models/edit_profile_screen_model/state_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  Datum? countryDropDownValue;
  DatumState? stateDropDownValue;


  RxList<Datum> countryLists = RxList();
  RxList<DatumState> stateLists = [DatumState(id: 0, name: 'Select State', countryId: 0)].obs;
  RxList<DatumCity> cityLists = [DatumCity(id: 0, name: 'Select City', stateId: 0)].obs;

  getAllCountryData() async {
    isLoading(true);
    String url = ApiUrl.CountryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      AllCountryData countryList = AllCountryData.fromJson(json.decode(response.body));
      isStatus = countryList.success.obs;

      if(isStatus.value){
        countryLists = countryList.data.obs;
        countryDropDownValue = countryLists[0];
        print('countryLists : $countryLists');
      } else {
        print('Country False False');
      }
    } catch(e) {
      print('Country Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getStateData(int countryId) async {
    isLoading(true);
    String url = ApiUrl.StateApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$countryId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      StateData stateData = StateData.fromJson(json.decode(response.body));
      isStatus = stateData.success.obs;
      if(isStatus.value){
        stateLists.clear();
        stateLists.add(DatumState(id: 0, name: 'Select State', countryId: 0));
        stateLists.addAll(stateData.data);
        stateDropDownValue = stateLists[0];
        print('stateLists : $stateLists');
      } else {
        print('State False False');
      }
    } catch(e) {
      print('State Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getCityData(int stateId) async {
    isLoading(true);
    String url = ApiUrl.CityApi;
    print('Url : $url');

    try{
      Map data = {
        "id": stateId
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      CityData cityData = CityData.fromJson(json.decode(response.body));
      isStatus = cityData.success.obs;

      if(isStatus.value){
        cityLists.addAll(cityData.data);
      } else {
        print('City False False');
      }
    } catch(e){
      print('City Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllCountryData();
    stateDropDownValue = stateLists[0];
    super.onInit();
  }
}