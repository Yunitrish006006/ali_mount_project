import 'package:flutter/services.dart';

class Place {
  String iconPath = "";
  String voicePath = "";
  List<Offset> points = [];
  Rect myRect = Offset(0, 0) & Size(1.0, 1.0);
  String introduction = "";
}