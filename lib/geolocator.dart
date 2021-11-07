import 'package:geolocator/geolocator.dart';

import 'dart:async';

class location {
  late double latitude;
   late double longitude;
  Future<void>getcurrentlocation()async{
    try{
    Position position = await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high) ;
    latitude =position.latitude;
    longitude =position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}