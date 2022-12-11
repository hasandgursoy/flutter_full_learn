import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/Scaffold_learn.dart';
import 'package:flutter_full_learn/303/feed_view.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ResourceContext()),
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier())
      ],
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Genel olarak projenin ayarlarını yapmak istiyorsak burdan yapıyoruz.
      theme: context.watch<ThemeNotifier>().currentTheme,
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

      // Tanımlandığı Class'a bak güzel bir bakış açısı
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const ScaffoldLearnView();
      //     },
      //   );
      // },
      // routes: NavigatorRoutes().items,

      // Route's kullanıcaksak home veremiyoruz. '/' işareti bize homu getircek hemen yukarıda
      // home: const PackageLearnView(),

      onGenerateRoute: (settings) {
        // Yukarıda mixin olarak bunun ekledim şuan o yüzden func'ını direk çağırabiliyorum.
        return onGenerateRoute(settings);
      },
    );
  }
}
