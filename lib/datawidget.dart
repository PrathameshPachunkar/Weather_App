import 'dart:math';

import 'package:flutter/material.dart';
import 'weatherscreen.dart';

weatherapp data = weatherapp();


Container container(int temp,double maxtemp,double mintemp, int feelslike,int visibility,String cityname) {
  return Container(

width: 350,
decoration: BoxDecoration(
  color: Colors.black.withOpacity(0.4),
  shape: BoxShape.circle,
),
child: Column(
  children: [
    Container(
      width: 350,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,

          border:  Border.all(width: 0.5,color: Colors.white,)
      ),
      child: Column(
        children: [
          Container(
            child: Text('$temp°',style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    ),
  ],
),
);
}
