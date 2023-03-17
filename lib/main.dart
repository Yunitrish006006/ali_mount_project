import 'package:flutter/material.dart';

void main() {
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

const List<Offset> x = [Offset(21.5,170.5),Offset(72.5,219.5)];

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  bool darkTheme = false;
  Offset? _tapPosition;
  String _room = "none";
  String currentRoomPicture = "none";

  void _getTapPosition(TapDownDetails details) {
    final tapPosition = details.localPosition;
    var x = tapPosition.dx;
    var y = tapPosition.dy;
    if (14 < x && x < 195) {
      if(75.5 < y && y < 125) {
        if (x < 30) {
          _room = "洋館14";
          currentRoomPicture = "west/13~15";
        }
        else if (x < 73.5) {
          _room = "洋館05";
          currentRoomPicture = "west/05";
        }
        else if(73.5 < x && x < 133.5) {
          _room = "洋館04";
          currentRoomPicture = "west/04";
        }
        else if(133.5 < x && x < 213.5) {
          _room = "洋館03";
          currentRoomPicture = "west/03";
        }
      }
      else if (150 < y && y < 190) {
        if (x < 30) {
          _room = "洋館14";
          currentRoomPicture = "west/13~15";
        }
        else if(x < 56) {
          _room = "洋館07";
          currentRoomPicture = "west/07";
        }
      }
    }
    else {
      _room = "not found";
      currentRoomPicture = "none";
    }
    setState(() {
      _tapPosition = tapPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.grey,
        appBar: AppBar (
          title: Text("阿里山蔣中正行館\t(${_tapPosition?.dx.toStringAsFixed(2) ?? "x"},${_tapPosition?.dy.toStringAsFixed(2) ?? "y"})"),
          backgroundColor: Colors.white60,
          centerTitle: false,
        ),
        body: Container (
            color: Colors.black26,
            child: Column(
                children: <Widget> [
                  Transform.scale(
                      scale: 2.0,
                      child: Container(
                        width: 1500.0,
                        height: 500.0,
                        child: DraggableImage(imageUrl: "assets/map.png")
                      )
                  ),
                  // GestureDetector(
                  // onTapDown:(details) => _getTapPosition(details),
                  // child: const Image(image: AssetImage('assets/map.png'))
                  // ),
                  Text("current room:$_room")
                  // Image(image: AssetImage('assets/$currentRoomPicture.jpg')),

                ]
            )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _tapPosition = const Offset(0,0);
          },
          backgroundColor: Colors.blueGrey,
          label: const Text("查看介紹"),
          icon: const Icon(Icons.remove_red_eye_outlined),
        )
    );
  }
}
//==============================================================================
class DraggableImage extends StatelessWidget {
  final String imageUrl;
  final double maxScale;

  DraggableImage({
    required this.imageUrl,
    this.maxScale = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 1.0,
      maxScale: maxScale,
      child: Image.asset(imageUrl,fit: BoxFit.contain),
    );
  }
}
//==============================================================================