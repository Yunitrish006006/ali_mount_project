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
        backgroundColor: darkTheme ? null : Colors.white,
        appBar: AppBar (
          title: const Text("阿里山蔣中正行館"),
          backgroundColor: Colors.white60,
          centerTitle: false,
        ),
        body: Container (
            color: Colors.black26,
            child:InteractiveImage(items: [
              InteractiveImageItem(
                imagePath: 'assets/east/01.jpg',
                title: '洋館 01 主玄關',
                subtitle: '由於日本傳統文化中階級分明，因此該玄關於日治時期功能為提供重要貴賓直接出入，服務人員並不會由此出入。',
                position: Offset(100, 345),
              ),
            ],)
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

class InteractiveImage extends StatefulWidget {
  final List<InteractiveImageItem> items;

  InteractiveImage({required this.items});

  @override
  _InteractiveImageState createState() => _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {
  late Size imageSize;
  late double xPosition;
  late double yPosition;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      xPosition += details.delta.dx;
      yPosition += details.delta.dy;
    });
  }

  @override
  void initState() {
    super.initState();
    xPosition = 0;
    yPosition = 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        imageSize = Size(constraints.maxWidth, constraints.maxHeight);

        return GestureDetector(
          onPanUpdate: _onPanUpdate,
          child: Stack(
            children: [
              Positioned(
                left: xPosition,
                top: yPosition,
                child: SizedBox(
                  width: imageSize.width,
                  height: imageSize.height,
                  child: Image.asset(
                    'assets/map.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ...widget.items.map(
                    (item) {
                  return Positioned(
                    left: item.position.dx + xPosition,
                    top: item.position.dy + yPosition,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: ListTile(
                                leading: Image.asset(
                                  item.imagePath,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(item.title),
                                subtitle: Text(item.subtitle),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        );
      },
    );
  }
}

class InteractiveImageItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final Offset position;

  InteractiveImageItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.position,
  });
}

//==============================================================================