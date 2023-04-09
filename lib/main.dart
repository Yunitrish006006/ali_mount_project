import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:ali_mount_project/audio_button.dart';
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
  Size mySize = Size(100,100);

  Future<void> _loadPlaces() async {
    String jsonString = await rootBundle.loadString('assets/index.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<Place> values = [];
    data.forEach((key, value) {
      Place temp = Place();
      temp.introduction = value['introduction'];
      temp.iconPath = value['picture'];
      temp.voicePath = value['voice'];
      Map<String, dynamic> area = value["area"];
      area.forEach((key, value) {
        temp.points.add(Offset(value['x'] as double, value['y'] as double));
      });
      mySize = Size((value["area"]["p3"]['x'] as double) - (value["area"]["p1"]['x'] as double), (value["area"]["p3"]['y'] as double) - (value["area"]["p1"]['y'] as double));
      temp.myRect = Offset(value["area"]["p1"]['x'] as double, value["area"]["p1"]['y'] as double) & mySize;
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
    final List<Path> polygonRegions = places.map((e) {
      Path p = Path();
      // p.addPolygon(e.points, true);
      p.addRect(e.myRect); p.close();
      return p;
    }).toList();
    final List<Color> colors = List.generate(places.length, (index) => Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.2));
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 30,
          title: Text('阿里山貴賓館導覽系統'),
          centerTitle: true,
          backgroundColor: Color(0x44000000),
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
                        // colors[i] = const Color.fromRGBO(50, 50, 200, 0.5);
                        // print(places[i].myRect);
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
                                  Expanded(flex:24,child: SizedBox.expand(child:Image.asset(places[i].iconPath, fit: BoxFit.fitWidth))),
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
                                                          places[i].introduction,
                                                          style: const TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none))
                                                  ))),
                                          Expanded(flex:1,child:Column()),
                                          Expanded(
                                              flex: 2,
                                              child:Align(
                                                alignment: Alignment.centerLeft,
                                                child: AudioButton(audioPath: places[i].voicePath),
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
                      regions: polygonRegions,
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