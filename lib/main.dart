import 'dart:async';
import 'dart:math';
import 'package:ali_mount_project/audio_button.dart';
import 'package:ali_mount_project/image_map.dart';
import 'package:ali_mount_project/place.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

List<Place> placeData=[];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Place.loadPlaces(placeData);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]).then((value) => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
      )
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool darkTheme = true;
  @override
  void initState() {super.initState();}
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = List.generate(placeData.length, (index) => Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.2));
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 30,
          title: const Text('阿里山貴賓館導覽系統'),
          centerTitle: true,
          backgroundColor: const Color(0x44000000),
          elevation: 0.0,
        ),
        body: Container (
            color: Colors.white,
            child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(0),
                minScale: 0.5,
                maxScale: 4,
                child: Center(
                    child:ImageMap(
                      imagePath: 'assets/texture/map.png',
                      imageSize: const Size(3309, 1861),
                      onTap: (i) {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black12.withOpacity(0.9), // Background color
                          barrierDismissible: false,
                          barrierLabel: 'Dialog',
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) {
                            return GestureDetector(
                              onTap: () => {Navigator.pop(context), AudioButton.audioPlayer.stop()},
                              child: Row(
                                children: <Widget>[
                                  Expanded(flex:24,child: SizedBox.expand(child:Image.asset(placeData[i].iconPath, fit: BoxFit.fitWidth))),
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
                                                          placeData[i].introduction,
                                                          style: const TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none))
                                                  ))),
                                          Expanded(flex:1,child:Column()),
                                          Expanded(
                                              flex: 2,
                                              child:Align(
                                                alignment: Alignment.centerLeft,
                                                child: AudioButton(audioPath: placeData[i].voicePath),
                                              )
                                          ),
                                          Expanded(flex:1,child:Column())
                                        ],
                                      )
                                  ),
                                  Expanded(flex:1,child: Column())
                                ],
                              ),
                            );
                          },
                        );
                        setState(() {});
                      },
                      regions: placeData.map((place) => place.polygonRegion).toList(),
                      regionColors: colors,
                    )
                )
            )
        ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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