import 'package:sky_scrapper_code/Models/weather_model.dart';

class WeatherGet_Model {

  Future<Weather?>? getWeather;
  List MySearch;

  WeatherGet_Model(this.getWeather,this.MySearch);
}