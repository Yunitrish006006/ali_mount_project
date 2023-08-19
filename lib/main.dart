import 'package:ali_mount_project/screen/map_page.dart';
import 'package:flutter/material.dart';

import 'screen/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const LoadPage(),
    routes: {
      '/load_page': (context) => const LoadPage(),
      '/map_page': (context) => const MapPage()
    },
  ));
}
