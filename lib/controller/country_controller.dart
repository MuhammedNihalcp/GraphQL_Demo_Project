

import 'package:get/get.dart';
import 'package:graph_ql_sample/model/country_model.dart';
import 'package:graph_ql_sample/service/county_service.dart';

class CountriesController extends GetxController {

List<Continent>continent = [];
    
  void getConutries()async{
   await CountryService().getCountries().then((value) {
    if (value!=null) {
      continent = value;
      update();
    }
   });
  }
}