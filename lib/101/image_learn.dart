import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PngImage(path: ImageItems().fluor),
          // Image gelmesse errorBuilder ile istediğimiz şeyi gösterebiliyoruz.
          Image.network("https://www.indyturk.com/sies/default/files/styles/1368x911/public/article/main_image/2021/06/09/682996-991246141.jpg?itok=dZcE0Trg",
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          )
        ],
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  const PngImage({
    Key? key, required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _imagePath,
      fit: BoxFit.cover,
    );
  }

  String get _imagePath => 'assets/$path';
}

// Eğer image'ı telefonun kendi belliğinden çekiyorsak image.file()
// Eğer bytearray olarak geliyorsa imageler image.memory()

class ImageItems {
  final String fluor = 'download.png';
}
