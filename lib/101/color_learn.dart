import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          color: Theme.of(context).colorScheme.background,
          child: Text(
            'data',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).errorColor,
                ),
          )),
    );
  }
}

class ColorsItems {
  final Color poersche = const Color(0xffEDBF61);
  final Color sulu = const Color.fromRGBO(198, 237, 97, 1);
}
