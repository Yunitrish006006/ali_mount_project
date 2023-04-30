import 'dart:async';
import 'package:ali_mount_project/place.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  LoadScreenState createState() => LoadScreenState();
}

class LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    Place.loadPlaces(placeData);
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const MainPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/texture/logo.png'),
      ),
    );
  }
}