import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/WeatherGet_Provider.dart';
import 'package:provider/provider.dart';
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
                      SizedBox(
                        height: h * 0.02,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.23,
                              width: w,
                              child: ListView.builder(
                                itemCount: data.hour.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) => Container(
                                  height: h * 0.1,
                                  width: w * 0.18,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: (data.hour[DateTime.now().hour]
                                                    ['time']
                                                .toString()
                                                .split("25")[1] ==
                                            data.hour[i]['time']
                                                .toString()
                                                .split("25")[1])
                                        ? Colors.blue.shade900
                                        : Color(0xff262A56),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      (data.hour[DateTime.now().hour]['time']
                                                  .toString()
                                                  .split("25")[1] ==
                                              data.hour[i]['time']
                                                  .toString()
                                                  .split("25")[1]) // jo pela
                                          ? Text(
                                              "Now",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: h * 0.022,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              data.hour[i]['time']
                                                  .toString()
                                                  .split("25")[1],
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.022),
                                              ),
                                            ),
                                      Image.network(
                                          "http:${data.hour[i]['condition']['icon']}"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.hour[i]['temp_c'].toString(),
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: h * 0.025),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(2, -10),
                                            child: Text(
                                              "o",
                                              style: TextStyle(
                                                  color: Colors.white54),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: h * 0.21,
                          width: w,
                          decoration: BoxDecoration(
                            color: Color(0xff30225f),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0xff4c3b88),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.snowing,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "AIR QUALITY",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      "3-Low Health Risk",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.022,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                  height: h * 0.005,
                                  width: w,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff3a59b3),
                                        Color(0xff8f59d7),
                                        Color(0xffcc52d2),
                                        Color(0xffe54499),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Transform.translate(
                                    offset: Offset(-h * 0.13, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "See more",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: h * 0.025),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey.shade700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16,bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.23,
                              width: w * 0.45,
                              decoration: BoxDecoration(
                                color: Color(0xff30225f),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Color(0xff4c3b88),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sunny,
                                          color: Colors.grey.shade500,
                                        ),
                                        Text(
                                          " UV INDEX",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${data.uv}",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.04,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Moderate",
                                          style: TextStyle(
                                            fontSize: h * 0.03,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Container(
                                      height: h * 0.005,
                                      width: w,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xff3a59b3),
                                            Color(0xff8f59d7),
                                            Color(0xffcc52d2),
                                            Color(0xffe54499),
                                          ],
                                        ),
                                      ),
                                      child: Transform.translate(
                                        offset: Offset(-h * 0.08, 0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Container(
                              height: h * 0.23,
                              width: w * 0.45,
                              decoration: BoxDecoration(
                                color: Color(0xff30225f),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Color(0xff4c3b88),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sunny_snowing,
                                          color: Colors.grey.shade500,
                                        ),
                                        Text(
                                          " SUNRISE",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${data.sunrise}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.04,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Text("sunset : ${data.sunset}", style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.018,
                                          ),
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.25,
                              width: w * 0.45,
                              decoration: BoxDecoration(
                                color: Color(0xff30225f),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Color(0xff4c3b88),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.air,
                                          color: Colors.grey.shade500,
                                        ),
                                        Text(
                                          " WIND",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: h * 0.2,
                                    width: w * 0.35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff44455a),
                                        width: 10
                                      )
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Text("N",style:
                                          TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: h * 0.02,
                                          ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 25),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("W",style:
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: h * 0.02,
                                              ),
                                              ),
                                              Column(
                                                children: [
                                                  Text("${data.wind_mph}",style:
                                                  TextStyle(
                                                    fontSize: h * 0.025,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),),
                                                  Text("km/h",style: TextStyle(color: Colors.white54,fontSize: h * 0.015),),
                                                ],
                                              ),
                                              Text("E",style:
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: h * 0.02,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Text("S",style:
                                          TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02,
                                          ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Container(
                              height: h * 0.25,
                              width: w * 0.45,
                              decoration: BoxDecoration(
                                color: Color(0xff30225f),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Color(0xff4c3b88),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                          color: Colors.grey.shade500,
                                        ),
                                        Text(
                                          " RAINFALL",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${data.precip_mm} mm",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.04,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "in last hour",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.025,
                      )
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
