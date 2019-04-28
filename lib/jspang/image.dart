import 'package:flutter/material.dart';

void main() => runApp(new ImageApp());

class ImageApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Image.network(
              'http://blogimages.jspang.com/blogtouxiang1.jpg',
              fit: BoxFit.none,
              color: Colors.grey,
              colorBlendMode: BlendMode.darken, // 颜色混合到图片上
              repeat: ImageRepeat.repeat,
            ),
            width: 300.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}