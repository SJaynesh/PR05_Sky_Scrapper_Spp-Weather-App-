import 'package:flutter/material.dart';
import 'package:sky_scrapper_code/Models/WeatherGet_Model.dart';

import '../Models/api_helper.dart';

class WeatherGet_Provider extends ChangeNotifier{

  WeatherGet_Model w1 = WeatherGet_Model(null,[]);

  searchWeather(val) {
    Future.delayed(Duration.zero,(){
      w1.getWeather = APIHelper.apiHelper.fetchSingleWeather(val);
    });

    notifyListeners();
  }

  AddValue(val) {
    w1.MySearch.add(val);
    notifyListeners();
  }

  deleteValue(i) {
    w1.MySearch.removeAt(i);
    notifyListeners();
  }
}