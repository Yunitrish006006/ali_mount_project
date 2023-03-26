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

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.grey,
        appBar: AppBar (
          title: const Text("阿里山蔣中正行館"),
          backgroundColor: Colors.white60,
          centerTitle: false,
        ),
        body: Container (
            color: Colors.black26,
            child: DraggableImage(imageUrl: "assets/map.png")
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
//==============================================================================
class DraggableImage extends StatefulWidget {
  final String imageUrl;
  final double maxScale;

  const DraggableImage({super.key,
    required this.imageUrl,
    this.maxScale = 2.0
  });

  @override
  State<DraggableImage> createState() => _DraggableImageState();
}

class _DraggableImageState extends State<DraggableImage> {
  Offset _tapPosition = const Offset(0, 0);

  String _room = "none";

  String currentRoomPicture = "none";

  void getPos(TapDownDetails details) {
    final pos = details.localPosition;
    var x = pos.dx;
    var y = pos.dy;
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
    _tapPosition = pos;
  }

  @override
  Widget build(BuildContext context) {
    final double imgWidth;
    if (Image.asset(widget.imageUrl).width != null) {
      imgWidth = (Image
          .asset(widget.imageUrl)
          .width! / 2);
    }
    else {
      imgWidth = double.parse("140");
    }
    final double imgHeight;
    if (Image.asset(widget.imageUrl).height != null) {
      imgHeight = (Image
          .asset(widget.imageUrl)
          .height! / 2);
    }
    else {
      imgHeight = double.parse("250");
    }
    return InteractiveViewer(
      panEnabled: true,
      boundaryMargin: EdgeInsets.only(left: imgWidth,right: imgWidth,top: imgHeight,bottom: imgHeight),
      minScale: 0.5,
      maxScale: widget.maxScale,
      child: GestureDetector(
          onTapDown:(details) => getPos(details),
          child:
          Column(
            children: <Widget>[
              Text("Offset: (${_tapPosition.dx.toStringAsFixed(2)},${_tapPosition.dy.toStringAsFixed(2)})"),
              Transform.scale(
                  scale: 4.0,
                  child: SizedBox(
                      width: 1450.0,
                      height: imgHeight / 2 ,
                      child: Image.asset(widget.imageUrl, fit: BoxFit.contain)
                  )
              ),
              Text("current room:$_room"),
              // Image(image: AssetImage('assets/$currentRoomPicture.jpg')),
            ],
          ),
        )
    );
  }
}
//==============================================================================