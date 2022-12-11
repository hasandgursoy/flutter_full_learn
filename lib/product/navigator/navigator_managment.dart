import 'package:flutter/material.dart';

import 'navigator_routes.dart';

// Bu yapı en temiz yöntem kesinlikle kullanılması gereken bir yöntem.

class NavigatorManager {
  NavigatorManager._();

  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route,{Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route.withParaf,arguments:arguments );
  }

}
