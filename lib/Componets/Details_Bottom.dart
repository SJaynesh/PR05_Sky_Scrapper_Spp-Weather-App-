import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/api_helper.dart';
import '../Models/weather_model.dart';

class Details_Weather extends StatefulWidget {
  const Details_Weather({Key? key}) : super(key: key);

  @override
  State<Details_Weather> createState() => _Details_WeatherState();
}

class _Details_WeatherState extends State<Details_Weather> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return FutureBuilder(
        future: APIHelper.apiHelper.fetchSingleWeather(),
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
                : Column(
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.008,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xff562d5b),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hourly Forecast",
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                  fontSize: h * 0.023,
                                  color: Color(0xff9697ac),
                                ),
                              ),
                            ),
                            Text(
                              "Weekly Forecast",
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                  fontSize: h * 0.023,
                                  color: Color(0xff9697ac),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xffb08ddd).withOpacity(0.7),
                        thickness: 2,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.25,
                              width: w,
                              child: ListView.builder(
                                itemCount: data.hour.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) => Container(
                                  height: h * 0.1,
                                  width: w * 0.2,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff442d81),
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 5,
                                        offset: Offset(-2, -2),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        data.hour[i]['time']
                                            .toString()
                                            .split("24")[1],
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.025
                                          ),
                                        ),
                                      ),
                                      Image.network("${data.hour[i]['condition']['icon']}"),
                                      Text(
                                        data.hour[i]['temp_c'].toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.025
                                          ),
                                        ),
                                      ),
                                    ],
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.07,
                ),
                LinearProgressIndicator(
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          );
        });
  }
}
