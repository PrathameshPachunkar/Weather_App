import 'package:flutter/material.dart';
import 'weatherscreen.dart';

weatherapp data = weatherapp();
var temp = data.temp;
Widget datawid = Container(

  width: 350,
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.4),
    shape: BoxShape.circle,
  ),
  child: Column(
    children: [
      Container(
        child: Text('$temp'),
      ),
    ],
  ),
);