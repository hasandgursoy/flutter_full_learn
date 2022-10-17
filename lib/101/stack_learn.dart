import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(child: Container(color: Colors.blue, height: 100)),
          Positioned(
            height: 100,
            width: 25,
            top: 20,
            child: Container(
              color: Colors.amberAccent,
            ),
          )
        ],
      ),
    );
  }
}




// Bir yerde üst üste binme varsa stack kullanıcaksın !_!
// Positioned içerisinde yapıcaz ne lazımsa.