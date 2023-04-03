import 'package:ali_mount_project/ImageMap.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const LoadPage(),
    );
  }
}

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  bool darkTheme = false;

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
      ]
    ];
    final List<Path> polygonRegions = points.map((e) {
      Path p = Path();
      p.addPolygon(e, true);
      return p;
    }).toList();
    final List<Color> colors = List.generate(points.length, (index) => Color.fromRGBO(0*index, 0*index, (60*index)%255, 0.5));

    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.white,
        body: Container (
            color: Colors.black26,
            child:ImageMap(
              imagePath: 'assets/map.png',
              imageSize: const Size(3309, 1861),
              onTap: (i) {
                colors[i] = colors[i] == const Color.fromRGBO(50, 50, 200, 0.5) ? const Color.fromRGBO(50, 200, 50, 0.5) : const Color.fromRGBO(50, 50, 200, 0.5);
                showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black12.withOpacity(0.6), // Background color
                  barrierDismissible: false,
                  barrierLabel: 'Dialog',
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: SizedBox.expand(child:
                            Image.asset(
                                      "assets/east/${i+1}.jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text("test line 1"),
                              Text("test line 2"),
                            ],
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Dismiss'),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
                setState(() {});
              },
              regions: polygonRegions,
              regionColors: colors,
            )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
          },
          backgroundColor: Colors.blueGrey,
          label: const Text("查看介紹"),
          icon: const Icon(Icons.remove_red_eye_outlined),
        )
    );
  }
}