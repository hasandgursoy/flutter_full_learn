import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres-resource/view/req_res_view.dart';
import '202/alert_learn.dart';
import '202/theme/light_theme.dart';
import '303/call_back_lear.dart';
import '303/feed_view.dart';
import '303/tabbar_view.dart';

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
      home: const ReqResView(),
    );
  }
}
