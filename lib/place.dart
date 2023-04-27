import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'audio_button.dart';

class Place {
  static Size mySize = const Size(100,100);
  String name = "";
  String iconPath = "";
  String voicePath = "";
  List<Offset> points = [];
  List<Rect> rects = [const Offset(0, 0) & const Size(1.0, 1.0)];
  String introduction = "";
  Path polygonRegion = Path();

  Place() {
    name = "";
    iconPath = "";
    voicePath = "";
    points = [];
    rects = [const Offset(0, 0) & const Size(1.0, 1.0)];
    introduction = "";
    polygonRegion = Path();
  }

  static void loadPointsToPolyRegion(Place temp,dynamic value) {
    Map<String, dynamic> area = value["areas"];
    area.forEach((key, value) {
      temp.points.add(Offset(value['x'] as double, value['y'] as double));
    });
    temp.polygonRegion.addPolygon(temp.points, true);
  }

  static void loadRectanglesToPolyRegion(Place temp,dynamic value) {
    mySize = Size((value["areas"]["p3"]['x'] as double) - (value["areas"]["p1"]['x'] as double), (value["areas"]["p3"]['y'] as double) - (value["areas"]["p1"]['y'] as double));
    temp.rects.add(Offset(value["areas"]["p1"]['x'] as double, value["areas"]["p1"]['y'] as double) & mySize);
    for (var rect in temp.rects) {
      temp.polygonRegion.addRect(rect);
    }
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
      loadPointsToPolyRegion(temp, value);
      // loadRectanglesToPolyRegion(temp, value);
      result.add(temp);
    });
  }

  GestureDetector page(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pop(context), AudioButton.audioPlayer.stop()},
        child: Row(
          children: <Widget>[
            Expanded(flex:24,child: SizedBox.expand(child:Image.asset(iconPath, fit: BoxFit.fitWidth))),
            Expanded(flex:1,child: Column()),
            Expanded(
                flex: 12,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 22,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                                child: Text(
                                    introduction,
                                    style: const TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none))
                            ))),
                    Expanded(flex:1,child:Column()),
                    Expanded(
                        flex: 2,
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child: AudioButton(audioPath: voicePath),
                        )
                    ),
                    Expanded(flex:1,child:Column())
                  ],
                )
            ),
            Expanded(flex:1,child: Column())
          ],
        )
    );
  }
}