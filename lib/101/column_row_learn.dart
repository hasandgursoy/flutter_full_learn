import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.red,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.lightGreen,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.purple,
                  )),
                ],
              )),
          const Spacer(flex: 2),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Text("123"), Text("321"), Text("421")],
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink,
              )),
          SizedBox(
            height: SizedBoxHegihts().height,
            child: Column(
              children: const [
                Expanded(child: Text("data")),
                Expanded(child: Text("data")),
                Expanded(child: Text("data")),
                Spacer(),
                Expanded(child: Text("data")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SizedBoxHegihts {
  final double height = 200;
}

// Ekranları responsive olarak design ederken yapmamız gereken Expanded yapısını flex yapısı ile beraber kullanmak.
// Peki biz sadece boşluk bırakmak istiyoruz ama bu da responsive olsun diyorsak o zaman olması gereken 
// Spacer() kullanmak ama flex yapısı ile birlikte kullanmak.
// Ekran 10 luk değere bölüyorsak flex ler üzerinden 4-2-2-2 olur 3-2-1-4 olur ne istiyorsan.

// MainAxis ve CrossAxis Aligment
// MainAxisAligment = Row daysa main olarak yatay kabul eder Column'daysa dikey.
// CrossAxisAligment = Row'daysa tam tersi yönü yani dikey kabul eder Colum daysa yatay.

// Eğer bir component'i sınırlandırıyorsak manuel değer ile içindeki yapıları expanded ile sarmalıyız bunu unutma önemli.

// Column ve Row'un MainAxisSize.max değeri default gelir eğer yapıları bir araya sıkıştırmak istiyorsak mainAxisSize.Min olarak işaretlememiz gerekiyor.  