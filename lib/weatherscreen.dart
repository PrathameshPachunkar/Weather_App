import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter/material.dart';
import 'Time.dart';
import 'main.dart';
import 'geolocator.dart';
class weatherapp extends StatefulWidget {
  weatherapp({this.locationweather});
  final locationweather;

  @override
  _weatherappState createState() => _weatherappState();
}

class _weatherappState extends State<weatherapp> {
  @override
  String apikey = '1c74a04bce1e09e4a6dacbf3eee4a3ed';
  Time time = Time();
  late int temp;
  late double maxtemp;
  late double mintemp;
  late String cityname;
  late int visibility;
  late String timeofday;
  late int imagenum;
  late int feelike;
  late String desc;
  late double windspeed;
  late String  weatherimage;
  late String url = 'http://openweathermap.org/img/wn/$weatherimage@2x.png'.toString();

  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationweather);
    updateui(widget.locationweather);
    var daytime = DateTime.now().hour;
    timeofday = time.gettime(daytime);
    imagenum = time.getimage(daytime);
    print(weatherimage);
  }

  updateui(dynamic weatherdata) {
    mintemp = weatherdata["main"]['temp_min'];
    maxtemp = weatherdata["main"]['temp_max'];
    visibility = weatherdata['visibility'];
    cityname = weatherdata['name'];
    double tptemp = weatherdata["main"]['temp'];
    temp =  tptemp.toInt();
   double tpfl = weatherdata["main"]['feels_like'];
    feelike =  tpfl.toInt();
    windspeed = weatherdata['wind']['speed'];
    weatherimage = weatherdata['weather'][0]['icon'];
    url = 'http://openweathermap.org/img/wn/$weatherimage@2x.png'.toString();
    desc = weatherdata['weather'][0]['description'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/assets/$imagenum.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.5,
                    color: Colors.white,
                  )),
            ),
          ),
          widgetinfo(
            top: 150,
            bottom: 0,
            left: 160,
            right: 0,
            colors: Colors.white,
            text: '$temp°',
            fontsize: 70,
          ),//tempdata
          widgetinfo(
              top: 230,
              bottom: 0,
              left: 220,
              right: 0,
              fontsize: 14,
              text: '$feelike°',
              colors: Colors.white),//feels like text
          widgetinfo(
              text: 'Feels Like', colors: Colors.white38, left: 150, top: 230),//feels like text
          widgetinfo(text: '$cityname', fontsize: 25, left: 160),//citynamedata
          widgetinfo(text: 'min', colors: Colors.white38, left: 30, top: 300),//mintemptext
          widgetinfo(text: '$mintemp°', top: 300, left: 60),//mintempdata
          widgetinfo(text: 'max', colors: Colors.white38, top: 300, left: 300),//maxtemptext
          widgetinfo(
              text: '$maxtemp°', colors: Colors.white, top: 300, left: 335),//maxtempdata
          widgetinfo(
              text: '$windspeed' '  meter/sec',
              colors: Colors.white,
              top: 450,
              left: 200),//winspeeddata
          widgetinfo(
              text: 'windspeed', colors: Colors.white38, top: 450, left: 110),//windspeedtext
          widgetinfo(text: '$desc',top: 400, left: 150),//descriptiondata
          Positioned(
            top: 0,
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              child: Image.network(url),//icon image
            ),
          ),
        ],
      ),
    );
  }

  Positioned widgetinfo({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
    double fontsize = 14,
    required String text,
    Color colors = Colors.white,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        child: Text(
          '$text',
          style: TextStyle(
              fontSize: fontsize, fontWeight: FontWeight.bold, color: colors),
        ),
      ),
    );
  }
}
