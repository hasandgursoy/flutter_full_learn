import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/202/service/service_learn.dart';

import '101/color_learn.dart';
import '202/alert_learn.dart';
import '202/animated_lear.dart';
import '202/cache/secure_storage/secure_storage.dart';
import '202/cache/shared_learn_cache.dart';
import '202/cache/user_shared_listview.dart';
import '202/form_learn_view.dart';
import '202/image_learn_202.dart';
import '202/model_view.dart';
import '202/oop_lear_view.dart';
import '202/package_learn.dart';
import '202/service/comments_view.dart';
import '202/service/service_learn_post.dart';
import '202/sheet_learn.dart';
import '202/state_manage/state_learn_view.dart';
import '202/theme/light_theme.dart';
import '202/theme_learn_view.dart';
import '202/widget_size_learn.dart';

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
      theme: LightTheme().theme,
      //  ThemeData.dark().copyWith(
      //   // Benim projemde Appbarlar Ortada olacak bir rule mesela bu .
      //   // AppBar da kod tekrarından kaçınmış oluyoruz her yeni sayfada aynı şeyleri yazmak zorunda kalmıyoruz.
      //   tabBarTheme: const TabBarTheme(),
      //   bottomAppBarTheme: const BottomAppBarTheme(color: Colors.redAccent),
      //   errorColor: ColorsItems().sulu,
      //   listTileTheme:
      //       const ListTileThemeData(contentPadding: EdgeInsets.all(0)),
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //   ),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: Colors.white,
      //   ),
      // ),
      home: const AlertLearnView(),
    );
  }
}
