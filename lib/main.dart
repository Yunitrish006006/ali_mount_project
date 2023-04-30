import 'package:ali_mount_project/image_map.dart';
import 'package:ali_mount_project/place.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'loading_page.dart';

List<Place> placeData=[];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]).then((value) => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoadScreen()
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
                      places: placeData,
                      imagePath: 'assets/texture/map.png',
                      imageSize: const Size(3309, 1861)
                    )
                )
            )
        ),
      // floatingActionButton:
    );
  }
}

