import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:ali_mount_project/image_map.dart';
import 'package:ali_mount_project/place.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  List<Place> places = [];
  bool darkTheme = true;

  Future<void> _loadPlaces() async {
    String jsonString = await rootBundle.loadString('assets/index.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<Place> values = [];
    data.forEach((key, value) {
      Place temp = Place();
      temp.introduction = value['introduction'];
      temp.iconPath = value['picture'];
      // temp.points = List<Offset>.from(jsonMap['points'].map((p) => Offset(p['x'], p['y'])))
      values.add(temp);
    });

    setState(() {
      places = values;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPlaces();
  }
  @override
  Widget build(BuildContext context) {
    const List<List<Offset>> points = [
      [
        Offset(800, 980),
        Offset(800, 1260),
        Offset(1070, 1260),
        Offset(1070, 980)
      ],
      [
        Offset(1080, 980),
        Offset(1080, 1600),
        Offset(1560, 1600),
        Offset(1560, 980)
      ],
      [
        Offset(1080, 360),
        Offset(1080, 780),
        Offset(1560, 780),
        Offset(1560, 360)
      ],
      [
        Offset(600, 360),
        Offset(600, 780),
        Offset(1080, 780),
        Offset(1080, 360)
      ],
      [
        Offset(250, 360),
        Offset(250, 780),
        Offset(600, 780),
        Offset(600, 360)
      ],
      [
        Offset(450, 980),
        Offset(450, 1340),
        Offset(800, 1340),
        Offset(800, 980)
      ],
      [
        Offset(260, 980),
        Offset(260, 1340),
        Offset(450, 1340),
        Offset(450, 980)
      ],
      [
        Offset(110, 910),
        Offset(110, 1040),
        Offset(260, 1040),
        Offset(260, 910)
      ],
      [
        Offset(110, 1040),
        Offset(110, 1130),
        Offset(260, 1130),
        Offset(260, 1040)
      ],
      [
        Offset(110, 1130),
        Offset(110, 1330),
        Offset(260, 1330),
        Offset(260, 1130)
      ],
      [
        Offset(450,780),
        Offset(450,980),
        Offset(1560,980),
        Offset(1560,780)
      ],
      [
        Offset(110,780),
        Offset(110,910),
        Offset(260,910),
        Offset(260,980),
        Offset(450,980),
        Offset(450,780)
      ],
      [
        Offset(1560, 230),
        Offset(1560, 640),
        Offset(1690, 640),
        Offset(1690, 230)
      ],
      [
        Offset(110, 230),
        Offset(110, 780),
        Offset(250, 780),
        Offset(250, 230)
      ],
      [
        Offset(250, 160),
        Offset(250, 360),
        Offset(1560, 360),
        Offset(1560, 160)
      ],
    //  ===============
      [
        Offset(2110, 770),
        Offset(2110, 1060),
        Offset(1770, 1060),
        Offset(1770, 770)
      ],
      [
        Offset(2390, 770),
        Offset(2390, 1060),
        Offset(2110, 1060),
        Offset(2110, 770)
      ],
      [
        Offset(2250, 1190),
        Offset(2250, 1470),
        Offset(1980, 1470),
        Offset(1980, 1190)
      ],
      [
        Offset(2450, 1190),
        Offset(2450, 1470),
        Offset(2250, 1470),
        Offset(2250, 1190)
      ],
      [
        Offset(2570, 1260),
        Offset(2570, 1475),
        Offset(2520, 1475),
        Offset(2520, 1750),
        Offset(2940, 1750),
        Offset(2940, 1475),
        Offset(2940, 1260)
      ],
      [
        Offset(1770, 1190),
        Offset(1770, 1470),
        Offset(1560, 1470),
        Offset(1560, 1190)
      ],
      [
        Offset(2620, 830),
        Offset(2620, 1060),
        Offset(2460, 1060),
        Offset(2460, 830)
      ],
      [
        Offset(2800, 830),
        Offset(2800, 1060),
        Offset(2620, 1060),
        Offset(2620, 830)
      ],
      [
        Offset(1910, 1190),
        Offset(1910, 1470),
        Offset(1770, 1470),
        Offset(1770, 1190)
      ],
      [
        Offset(1560, 640),
        Offset(1560, 1190),
        Offset(2660, 1190),
        Offset(2660, 1050),
        Offset(1700, 1050),
        Offset(1700, 640)
      ],
      [
        Offset(2810, 1050),
        Offset(2810, 1190),
        Offset(2660, 1190),
        Offset(2660, 1050)
      ],
      [
        Offset(1770, 640),
        Offset(1770, 780),
        Offset(2450, 780),
        Offset(2450, 640),
      ],
      [
        Offset(1910, 1470),
        Offset(1910, 1550),
        Offset(2520, 1550),
        Offset(2520, 1470),
      ],
      // [
      //   Offset(2900, 980),
      //   Offset(2900, 1260),
      //   Offset(3070, 1260),
      //   Offset(3070, 980),
      // ],
      // [
      //   Offset(2900, 640),
      //   Offset(2900, 880),
      //   Offset(3070, 880),
      //   Offset(3070, 640),
      // ],
      // [
      //   Offset(3070, 640),
      //   Offset(3070, 1260),
      //   Offset(3220, 1260),
      //   Offset(3220, 640),
      // ],
    ];
    final List<Path> polygonRegions = points.map((e) {
      Path p = Path();
      p.addPolygon(e, true);
      return p;
    }).toList();
    final List<Color> colors = List.generate(points.length, (index) => Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.2));
    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.white,
        body: Container (
            color: Colors.white,
            child:Center(
              child: ImageMap(
                imagePath: 'assets/texture/map.png',
                imageSize: const Size(3309, 1861),
                onTap: (i) {
                  colors[i] = colors[i] == const Color.fromRGBO(50, 50, 200, 0.5) ? const Color.fromRGBO(50, 200, 50, 0.5) : const Color.fromRGBO(50, 50, 200, 0.5);
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black12.withOpacity(0.9), // Background color
                    barrierDismissible: false,
                    barrierLabel: 'Dialog',
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: <Widget>[
                            Expanded(flex:24,child: SizedBox.expand(child:Image.asset(places[i].iconPath, fit: BoxFit.fitWidth))),
                            Expanded(flex:2,child: Column()),
                            Expanded(
                              flex: 12,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                                  child: Text(
                                    places[i].introduction,
                                    style: const TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none))
                                ))
                            ),
                            Expanded(flex:1,child: Column())
                          ],
                        ),
                      );
                    },
                  );
                  setState(() {});
                },
                regions: polygonRegions,
                regionColors: colors,
              ),
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