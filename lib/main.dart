import 'package:ali_mount_project/ImageMap.dart';
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
    const List<List<Offset>> points = [
      [
        Offset(178, 152),
        Offset(148, 179),
        Offset(125, 173),
        Offset(129, 191),
        Offset(87, 191),
        Offset(130, 226),
        Offset(121, 270),
        Offset(182, 285),
        Offset(185, 272),
        Offset(219, 276),
        Offset(239, 260),
        Offset(218, 225),
        Offset(245, 186),
      ]
    ];
    final List<Path> polygonRegions = points.map((e) {
      Path p = Path();
      p.addPolygon(e, true);
      return p;
    }).toList();
    final List<Color> colors = List.generate(points.length, (index) => const Color.fromRGBO(50, 50, 200, 0.5));

    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.white,
        body: Container (
            color: Colors.black26,
            child:ImageMap(
              imagePath: 'assets/map.png',
              imageSize: const Size(3309, 1861),
              onTap: (i) {
                colors[i] = colors[i] == const Color.fromRGBO(50, 50, 200, 0.5)
                    ? const Color.fromRGBO(50, 200, 50, 0.5)
                    : const Color.fromRGBO(50, 50, 200, 0.5);
                print(i);
              setState(() {}); },
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