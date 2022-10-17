import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              color: Colors.white,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              color: Colors.white,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20) +
                const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              color: Colors.white,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
// Bir projede paddingler zırt pırt değişmez eğer çok özel bir sebeb yoksa 
// adam 12-2-15-2 gibi değerler verdiyse müşteriye söyleyeceksin yada sen umursamayacaksın.
// Kural eğer çok kullanılan bir değer varsa bunu dışarıda bir yerde tanımlayacaksın o class dan çağıracaksın
// Projenin ortak olayları sürekli yeniden türetilmemeli DRY prensipini unutma.

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  
}
