import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/WeatherGet_Provider.dart';
import '../../Models/weather_model.dart';
import '../../utills/all_Atributes.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Provider.of<WeatherGet_Provider>(context).w1.getWeather,
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Center(
                  child: Text("ERROR : ${snapShot.error}"),
                );
              } else if (snapShot.hasData) {
                Weather? data = snapShot.data;
                return (data == null)
                    ? Center(
                        child: Text("No Data Available"),
                      )
                    : Stack(
                        children: [
                          Container(
                            height: h,
                            width: w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(BgimagePath + "bg.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Weather",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: h * 0.035,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextField(
                                  controller: Search,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  onSubmitted: (val) {
                                    Provider.of<WeatherGet_Provider>(context,
                                            listen: false).AddValue(val);
                                    Search.clear();
                                    // i++;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Search for a city or airport",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: h * 0.02),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color(0xff2f4489), width: 3),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color(0xff2f4489), width: 3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: Provider.of<WeatherGet_Provider>(context).w1.MySearch.length,
                                    itemBuilder: (context, i) => GestureDetector(
                                      onTap: () {
                                        Provider.of<WeatherGet_Provider>(context, listen: false).searchWeather(Provider.of<WeatherGet_Provider>(context,listen: false).w1.MySearch[i]);
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: h * 0.2,
                                        margin:
                                        EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadiusDirectional
                                              .only(
                                            topStart:
                                            Radius.circular(
                                                30),
                                            topEnd:
                                            Radius.circular(
                                                0),
                                            bottomEnd:
                                            Radius.circular(
                                                200),
                                            bottomStart:
                                            Radius.circular(
                                                30),
                                          ),
                                          gradient:
                                          LinearGradient(
                                            colors: [
                                              Color(0xff5735b1),
                                              Color(0xff372a86),
                                            ],
                                            begin: Alignment
                                                .centerLeft,
                                            end: Alignment
                                                .centerRight,
                                            stops: [0.3, 0.9],
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                IconButton(onPressed: (){
                                                  Provider.of<WeatherGet_Provider>(context,listen: false).deleteValue(i);
                                                }, icon: Icon(Icons.clear,color: Colors.grey,),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child: Icon(Icons.location_on_rounded,color: Colors.white54,size: h * 0.03,),
                                                ),
                                                Text(
                                                  Provider.of<WeatherGet_Provider>(context).w1.MySearch[i],
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: h * 0.035,
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1,

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
