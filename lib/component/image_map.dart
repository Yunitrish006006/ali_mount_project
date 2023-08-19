import 'package:ali_mount_project/service/place.dart';
import 'package:flutter/material.dart';

class ImageMap extends StatefulWidget {
  final String imagePath;
  final List<Place> places;
  final Size imageSize;
  final bool isDebug;
  const ImageMap(
      {Key? key,
      required this.places,
      required this.imagePath,
      required this.imageSize,
      this.isDebug = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ImageMapState();
}

class ImageMapState extends State<ImageMap> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          RenderBox b = context.findRenderObject() as RenderBox;
          Offset locPos = details.localPosition;
          double widthMul = widget.imageSize.width / b.size.width;
          double heightMul = widget.imageSize.height / b.size.height;
          Offset rawPos = Offset(locPos.dx * widthMul, locPos.dy * heightMul);
          for (int i = 0; i < widget.places.length; i++) {
            if (widget.places[i].polygonRegion.contains(rawPos)) {
              widget.places[i].showPage(context);
              return;
            }
          }
        },
        child: Image.asset(widget.imagePath));
  }
}
