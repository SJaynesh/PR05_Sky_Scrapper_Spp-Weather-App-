import 'package:flutter/material.dart';
import 'package:sky_scrapper_code/Componets/Details_Bottom.dart';
import 'package:sky_scrapper_code/Controllers/WeatherGet_Provider.dart';
import 'package:sky_scrapper_code/utills/all_Atributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../../Models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // getWeather = APIHelper.apiHelper.fetchSingleWeather();
    Future.delayed(Duration.zero,(){
      Provider.of<WeatherGet_Provider>(context,listen: false).searchWeather("Bengaluru");
    });
      }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Transform.scale(
          scale: 1.2,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Color(0xff472c7f).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                )),
                builder: (context) => DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.4,
                  maxChildSize: 0.9,
                  minChildSize: 0.32,
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: Details_Weather(),
                  ),
                ),
              );
            },
            backgroundColor: Color(0xffbfc3d0),
            child: Text(
              "➕",
              style: TextStyle(fontSize: h * 0.02),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.swipe_up_alt_outlined,
            Icons.list,
          ],
          iconSize: h * 0.045,
          activeIndex: activeIndex,
          gapWidth: h * 0.1,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: h * 0.05,
          rightCornerRadius: h * 0.05,
          height: h * 0.1,
          inactiveColor: Colors.white,
          activeColor: Colors.white,
          backgroundGradient: LinearGradient(colors: [
            Color(0xff2a2f56),
            Color(0xff3c3e72).withOpacity(0.9),
          ]),
          onTap: (i) {
            activeIndex = i;
            if(i==1){
              Navigator.of(context).pushNamed("SearchPage");
            }
            print("***********************");
            print(activeIndex);
            print("***********************");
          },
        ),
        backgroundColor: Color(0xff020b31),
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
                          Column(
                            children: [
                              SizedBox(
                                height: h * 0.1,
                              ),
                              Text(
                                "${data.name}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: h * 0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "                ${data.country}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: h * 0.015,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GradientText(
                                    "${data.temp_c}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: h * 0.08,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    colors: [
                                      Colors.white,
                                      Colors.white70,
                                      Colors.white10,
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: Offset(3, -30),
                                    child: Text(
                                      "°",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white38,
                                          fontSize: h * 0.05,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${data.ConditionText}",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "H:  ${data.lat}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: h * 0.018,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(1, -5),
                                    child: Text(
                                      "o",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: h * 0.01,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Text(
                                    "L:  ${data.lon}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: h * 0.018,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(1, -5),
                                    child: Text(
                                      "o",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: h * 0.01,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              Container(
                                height: h * 0.44,
                                width: w,
                                child:(data.ConditionText == "Sunny")
                                    ? Transform.scale(
                                  scaleX: 1.2,
                                  scaleY: 1.2,
                                  child: Image.asset(
                                    ConditionimagePath + "sunny.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : (data.ConditionText == "Clear")
                                    ? Transform.scale(
                                        scaleX: 1.2,
                                        scaleY: 1.25,
                                        child: Image.asset(
                                          ConditionimagePath + "nigth.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : (data.ConditionText == "Partly cloudy")
                                    ? Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    ConditionimagePath + "cloudy.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : (data.ConditionText == "Thundery outbreaks possible")
                                    ? Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    ConditionimagePath + "thund.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : (data.ConditionText == "Overcast")
                                    ? Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    ConditionimagePath + "overcast.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : (data.ConditionText == "Moderate or heavy snow showers")
                                    ? Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    ConditionimagePath + "snow.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : (data.ConditionText == "Patchy light drizzle")
                                    ? Transform.scale(
                                  scaleX: 1.2,
                                  scaleY: 1.5,
                                  child: Image.asset(
                                    ConditionimagePath + "drizzle.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : Transform.scale(
                                  scaleX: 1.2,
                                  scaleY: 1.6,
                                  child: Image.asset(
                                    ConditionimagePath + "normal.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
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
