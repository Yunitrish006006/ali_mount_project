import 'package:flutter/material.dart';

import '../component/image_map.dart';
import '../service/place.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  List<Place> placeData = [];
  @override
  void initState() {
    super.initState();
    Place.loadPlaces(placeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 24,
        title: const Text('阿里山貴賓館導覽系統'),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.33),
        elevation: 0.0,
      ),
      body: Container(
          color: Colors.white,
          child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(0),
              minScale: 0.5,
              maxScale: 4,
              child: Center(
                  child: ImageMap(
                      places: placeData,
                      imagePath: 'assets/texture/map.png',
                      imageSize: const Size(3309, 1861))))),
    );
  }
}
