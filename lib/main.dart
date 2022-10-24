import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_full_learn/101/Scaffold_learn.dart';
import 'package:flutter_full_learn/101/app_bar.dart';
import 'package:flutter_full_learn/101/button_learn.dart';
import 'package:flutter_full_learn/101/color_learn.dart';
import 'package:flutter_full_learn/101/column_row_learn.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';
import 'package:flutter_full_learn/101/page_view.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';
import 'package:flutter_full_learn/101/statefull_learn.dart';
import 'package:flutter_full_learn/101/stateless_learn.dart';
import 'package:flutter_full_learn/101/text_learn.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/demos/color_demos.dart';
import 'package:flutter_full_learn/demos/color_life_cycle.dart';
import 'package:flutter_full_learn/demos/note_demos_view.dart';
import '101/card_learn.dart';
import '101/custom_widget_learn.dart';
import '101/image_learn.dart';
import '101/indicator_learn.dart';
import '101/list_tile_learn.dart';
import '101/padding_learn.dart';
import '101/statefull_life_cycle_learn.dart';
import '101/text_field_learn.dart';
import 'demos/stack_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Genel olarak projenin ayarlarını yapmak istiyorsak burdan yapıyoruz.
      theme: ThemeData.dark().copyWith(
        // Benim projemde Appbarlar Ortada olacak bir rule mesela bu .
        // AppBar da kod tekrarından kaçınmış oluyoruz her yeni sayfada aynı şeyleri yazmak zorunda kalmıyoruz.
        errorColor: ColorsItems().sulu,
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.all(0)),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
      ),
      home:  const ListViewLearn(),
    );
  }
}
