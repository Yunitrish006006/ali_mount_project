import 'package:flutter/material.dart';
class ImageMap extends StatefulWidget {
  @override
  _ImageMapState createState() => _ImageMapState();
}

class _ImageMapState extends State<ImageMap> {
  final Map<String, String> _imageMap = {
    'topLeft': 'assets/east/01.jpg',
    'topRight': 'assets/east/02.jpg',
    'bottomLeft': 'assets/east/03.jpg',
    'bottomRight': 'assets/east/04.jpg',
  };

  String _selectedImage = '';
  String _selectedPosition = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      child: Stack(
        children: [
          Image.asset(
            'assets/map.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              '$_selectedPosition',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child:
              _selectedImage.isEmpty
                  ? Container()
                  : Image.asset(
                _selectedImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapUp(TapUpDetails details) {
    double x = details.localPosition.dx;
    double y = details.localPosition.dy;

    if (x <= 100 && y <= 100) {
      setState(() {
        _selectedPosition = 'Top Left';
        _selectedImage = _imageMap['topLeft']!;
      });
    } else if (x > 100 && y <= 100) {
      setState(() {
        _selectedPosition = 'Top Right';
        _selectedImage = _imageMap['topRight']!;
      });
    } else if (x <= 100 && y > 100) {
      setState(() {
        _selectedPosition = 'Bottom Left';
        _selectedImage = _imageMap['bottomLeft']!;
      });
    } else if (x > 100 && y > 100) {
      setState(() {
        _selectedPosition = 'Bottom Right';
        _selectedImage = _imageMap['bottomRight']!;
      });
    }
  }
}