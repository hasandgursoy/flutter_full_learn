import 'package:flutter_full_learn/303/navigator/navigate_home_detail.dart';

import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paraph = '/';
  final items = {
    "/": (context) => const LottieLearnView(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigationRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
