// Bir ekran olacak
// Bu ekranda 3 button ve bunlara basınca renk değişimi olacak
// Secili olan button selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  // setState demeye gerek yok çünkü draw edilmeden önce çalışıyor.
  @override
  void initState() {
    _backgroundColor = widget.initialColor;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Bu yapı önemli
    //inspect(widget);
    if (widget.initialColor != _backgroundColor) {
      changeBackgroundColor(widget.initialColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        // Hangi item'a basıldığını gösteriyor. items[] bir liste olduğu için value index temsil eder.
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(
              icon: _ColorContainer(color: Colors.red), label: "Red"),
          BottomNavigationBarItem(
              icon: _ColorContainer(color: Colors.yellow), label: "Yellow"),
          BottomNavigationBarItem(
              icon: _ColorContainer(color: Colors.blue), label: "Blue"),
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}
// Bu kod bloğu onTap
// print(value);
// Aşşağıdaki kod çok tehlikeli bir kod bunun yerine enum tanımlamak lazım.
// if (value == 0) {
// } else if (value == 1) {
// } else {}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
