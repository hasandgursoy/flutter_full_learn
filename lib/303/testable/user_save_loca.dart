// SOLID'e uygun bir tane de store yapısı yazalım.

import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getReadData(String key, IStore preferences) {
    final response = preferences.getString(key);
    return response;
  }
}

abstract class IStore {
  bool getString(String key);
}

class SharedPrefStore extends IStore {
  final SharedPreferences preferences;

  SharedPrefStore(this.preferences);

  @override
  bool getString(String key) {
    final response = preferences.getString(key);

    if (response?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}