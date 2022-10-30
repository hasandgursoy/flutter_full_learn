import 'package:flutter/material.dart';

class LightTheme {
  final _colorsName = LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _colorsName.blueMania,
            foregroundColor: const Color.fromARGB(255, 235, 233, 241)),
        // Mesela ben burda button'a göre özel color sheması tanımlıyorum ya dartta
        // bunu package_learn sayfasında background olarak theme dan okuyarak onPrimary vericem.
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.light(onPrimary: Colors.purple),
        ),
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(subtitle1: const TextStyle(fontSize: 25)),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            // Bütün durumlar için bunu yap demek için MaterialStateProperty'si kullanıyoruz.
            fillColor: MaterialStateProperty.all(Colors.greenAccent)));
  }
}

class LightColor {
  final Color greyButton = const Color.fromARGB(05, 02, 1233, 1);
  final Color blueMania = const Color.fromARGB(95, 64, 67, 241);
}
