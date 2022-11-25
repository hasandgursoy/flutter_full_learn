import 'package:flutter/material.dart';

// Part of'un olayı çok fazla logic dönmüyorsa import etmeden bir widget getirmeye çalıştığımızda yapmamız gereken şeydir kendisi.
part 'part_app.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartOfBar(),
    );
  }
}
