// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=Canada&aqi=no
// Partly cloudy
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=london&aqi=no
// Sunny
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=canberra&aqi=no
// Clear
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=BANGLADESH&aqi=no
// Thundery outbreaks possible
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=Switzerland.&aqi=no
// Overcast
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=kedarnath.&aqi=no
// Moderate or heavy snow showers
// https://api.weatherapi.com/v1/current.json?key=7c45c33977d64f5a89783251232305&q=Gulmarg.&aqi=no
// Patchy light drizzle



import 'package:flutter/material.dart';
import 'package:sky_scrapper_code/Componets/Details_Bottom.dart';
import 'package:sky_scrapper_code/Controllers/WeatherGet_Provider.dart';
import 'package:sky_scrapper_code/View/Screens/HomePage.dart';
import 'package:sky_scrapper_code/View/Screens/SearchPage.dart';
import 'package:sky_scrapper_code/View/Screens/SplachScreen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> WeatherGet_Provider()),
      ],
      builder: (context,_)=>  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => SplachScreen(),
        "HomePage" : (context) => HomePage(),
        "DetailWeather" : (context) => Details_Weather(),
        "SearchPage" : (context) => SearchPage(),
      },
    ),),
  );
}