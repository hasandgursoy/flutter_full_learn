import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_managment.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.fork_right_sharp),
        onPressed: () {
          NavigatorManager.instance
              .pushToPage(NavigateRoutes.detail, arguments: "MarcusAurelius");
          // Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf,
          //     // arguments: diğer sayfaya göndermek istediğimiz verileri okuyabildiğimiz bir yer :D
          //     arguments: {'HomeData': "Home Verisi"});
        },
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
