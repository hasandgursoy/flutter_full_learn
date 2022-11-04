import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.download.toWidget(height: 60 ),
    );
  }
}

// Harika Bir Yapı Yapıyorum Aşşağıya OOV

enum ImagePaths { download }

extension ImagePathExtension on ImagePaths {
  String path() {
    return 'assets/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
