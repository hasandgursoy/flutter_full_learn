import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloDart extends StatefulWidget {
  const CounterHelloDart({super.key});

  @override
  State<CounterHelloDart> createState() => _CounterHelloDartState();
}

class _CounterHelloDartState extends State<CounterHelloDart> {
  int _counterCustom = 0;
  // Projenin metinsel ifadelerini Product klasorunde language dosyası altında bir sınıf oluşturup toplamak ve ordan çağırmak her zaman daha mantıklı.
  final String _welcomeTitle = LanguageItems.welcomeTitle;

  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _updateCounter();
        },
        child: Text("$_welcomeTitle $_counterCustom"));
  }
}
