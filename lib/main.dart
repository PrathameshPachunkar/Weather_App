import 'package:flutter/material.dart';
import 'package:weather/weatherscreen.dart';
import 'geolocator.dart';
import 'package:weather/Networkhelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Weatherapp extends StatefulWidget {
  const Weatherapp({Key? key}) : super(key: key);

  @override
  _WeatherappState createState() => _WeatherappState();

}

class _WeatherappState extends State<Weatherapp> {
  @override
  String apikey ='1c74a04bce1e09e4a6dacbf3eee4a3ed';
 late double latitude;
  late double longitude;

  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationdata();
  }
  void getlocationdata() async{
    location Location = location();
   await Location.getcurrentlocation();
   latitude = Location.latitude;
    longitude = Location.longitude;

    Networkhelper networkhelper = Networkhelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric");
    final weatherdata = await networkhelper.getdata();
     Navigator.push(context, MaterialPageRoute(builder: (context){return weatherapp(locationweather: weatherdata,);}));
  }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: SpinKitPulse(color: Colors.white,size: 100,),),
    );
  }
}


