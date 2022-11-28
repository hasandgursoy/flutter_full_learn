enum LottieItems { themeChange, lightDark }

extension LottieItemsExtension on LottieItems {
// switch-case'in içini boi bırak parametre olarak this koy olay kapanıyor.
  String path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'theme_change';
      case LottieItems.lightDark:
        return 'light_dark';
    }
  }

  String get lottiePath => 'assets/lottie/${path()}.json';
}
