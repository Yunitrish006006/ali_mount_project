import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Place {

  static Size mySize = const Size(100,100);
  String name = "";
  String iconPath = "";
  String voicePath = "";
  List<Offset> points = [];
  Rect myRect = const Offset(0, 0) & const Size(1.0, 1.0);
  String introduction = "";
  Path polygonRegion = Path();

  Place() {
    name = "";
    iconPath = "";
    voicePath = "";
    points = [];
    myRect = const Offset(0, 0) & const Size(1.0, 1.0);
    introduction = "";
    polygonRegion = Path();
  }

  static Future<void> loadPlaces(List<Place> result) async{
    String jsonString = await rootBundle.loadString("assets/index.json");
    Map<String,dynamic> data = json.decode(jsonString);
    data.forEach((key, value) {
      Place temp = Place();
      temp.name = key;
      temp.introduction = value['introduction'];
      temp.iconPath = value['picture'];
      temp.voicePath = value['voice'];
      //進階版
      // Map<String, dynamic> area = value["area"];
      // area.forEach((key, value) {
      //   temp.points.add(Offset(value['x'] as double, value['y'] as double));
      // });
      // temp.polygonRegion.addPolygon(temp.points, true);
      // 縮減版
      mySize = Size((value["area"]["p3"]['x'] as double) - (value["area"]["p1"]['x'] as double), (value["area"]["p3"]['y'] as double) - (value["area"]["p1"]['y'] as double));
      temp.myRect = Offset(value["area"]["p1"]['x'] as double, value["area"]["p1"]['y'] as double) & mySize;
      temp.polygonRegion.addRect(temp.myRect);
      result.add(temp);
    });
  }
}