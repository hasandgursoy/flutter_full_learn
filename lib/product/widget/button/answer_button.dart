import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, required this.onNumber});
  final bool Function(int number) onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;

  // bana bir sayı dön random bu sayı kontrol edip sana bir cevap vericem
  // bu cevaba göre butonun rengini güncelle
  // eger dogru ise yesil yanlıs ise kırmızı yap
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
      child: const Text("Data"),
      onPressed: () {
        var randomNumber = Random().nextInt(10);
        var response = widget.onNumber.call(randomNumber);
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.redAccent;
        });
      },
    );
  }
}
