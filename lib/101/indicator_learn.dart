import 'package:flutter/material.dart';

class IndicatorLearnView extends StatelessWidget {
  const IndicatorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CenterCircularProgressIndicator(),
      ),
    );
  }
}

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    Key? key,
  }) : super(key: key);
  final redColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 7.0,
      // Color propu verdik açık bir şekilde yukarıda bu yüzden bu yapının ismi CenterCircularRedProgress olmalı.
      color: redColor, 
      value: 0.5,
      backgroundColor: Colors.white,
    );
  }
}

// LinearProgressIndicator yapısıda var ona da bak