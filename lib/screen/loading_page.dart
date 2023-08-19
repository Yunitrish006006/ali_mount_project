import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/map_page');
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
