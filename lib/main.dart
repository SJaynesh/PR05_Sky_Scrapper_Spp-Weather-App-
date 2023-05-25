import 'package:flutter/material.dart';
import 'package:sky_scrapper_code/Componets/Details_Bottom.dart';
import 'package:sky_scrapper_code/Controllers/Connectivity_Provider.dart';
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
        ChangeNotifierProvider(create: (context)=> Connectivity_Provider()),
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