import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter/material.dart';
import 'Time.dart';
class weatherapp extends StatefulWidget {

  weatherapp({this.locationweather});
  final locationweather;
  late int temp;
  late double maxtemp;
  late double mintemp;
  late String cityname;
  late int visibility;
  late String timeofday;
  late int imagenum;

  @override
  _weatherappState createState() => _weatherappState();

}
class _weatherappState extends State<weatherapp> {
  @override
  Time time = Time();
  late int temp;
  late double maxtemp;
  late double mintemp;
  late String cityname;
  late int visibility;
   late String timeofday;
   late int imagenum;
   late Widget widcont;
   late int feelike;



  void initState() {
    // TODO: implement initState
    super.initState();
    updateui(widget.locationweather);
print(widget.locationweather);
    var daytime = DateTime.now().hour;
    timeofday = time.gettime(daytime);
    imagenum = time.getimage(daytime);
  }
  updateui(dynamic weatherdata){
     mintemp = weatherdata["main"]['temp_min'];
     maxtemp = weatherdata["main"]['temp_max'];
     visibility = weatherdata['visibility'];
     cityname = weatherdata['name'];
     double tptemp = weatherdata["main"]['temp'];
     temp = tptemp.toInt();
     double tpfl = weatherdata["main"]['feels_like'];
     feelike =  tpfl.toInt();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('lib/assets/$imagenum.jpg',),
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,

                border:  Border.all(width: 0.5,color: Colors.white,)
              ),
              child: Container(
                height: 350,
                width: 350,
                child: Column(
                  children: [
                    Container(
                      child: Text('$temp°',style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
                    ),
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Text("feels like",style: TextStyle(color: Colors.white38),),),
                          SizedBox(
                            width: 5,
                          ),
                          Container(child: Text("$feelike°",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
