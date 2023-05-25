import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper_code/Models/weather_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<Weather?> fetchSingleWeather(String city) async {
    String baseUrl = "https://api.weatherapi.com/v1/forecast.json?key=7c45c33977d64f5a89783251232305&q=";
    String endPoint = "$city&aqi=no";

    String api = baseUrl + endPoint;

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      Weather weatherData = Weather.formMap(data: decodedData);

      return weatherData;
    }
  }
}
