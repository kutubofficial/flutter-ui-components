import 'package:flutter/material.dart';

class PhotoViewerPage extends StatelessWidget {
  final String imagePath;

  const PhotoViewerPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Hero(tag: imagePath, child: Image.asset(imagePath)),
      ),
    );
  }
}
