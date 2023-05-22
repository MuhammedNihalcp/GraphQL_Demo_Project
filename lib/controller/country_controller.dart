import 'package:get/get.dart';
import 'package:graph_ql_sample/model/country_model.dart';
import 'package:graph_ql_sample/service/county_service.dart';

class CountriesController extends GetxController {
  CountriesController() {
    getConutries();
  }

  List<Countries> countriesList = [];

  bool isLoading = false;

  void getConutries() async {
    isLoading = true;
    update();
    await CountryService().getCountries().then((value) {
      if (value != null) {
        countriesList = value;
        update();
        isLoading = false;
        update;
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
