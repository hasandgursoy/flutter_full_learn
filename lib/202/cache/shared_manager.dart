// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_full_learn/202/cache/shared_not_initialize.dart';

// 3 tane cache yöntemi var

// 1. Shared Preferenses
// 2. Flutter Secure Storage
// 3. Hive

// Burda kullandığımız yöntem 4 Aşamadan oluşuyor.
// Shared Preferenses instance'ı kullanacağın view da oluştur ama atama yapma onun için fonksiyon yazdım aşşağıda init();
// Sonra init'i async bir method'da çağır.
// Instance oluştukdan sonra Veri Ekle Ve ya Sil
// Sonra bu veriyi kullan. Bu kadar basit olay dikkat edilmesi gereken tekşey methodlar Async olduğu için ona senkron methodlarla beraber kullanılmadan önce
// Mantığa senkron methodlarıda async bir blok içine alıp sonra beraber kullanmak yoksa bir birlerini beklemeyecekler.

// Shared Preferences Dataları = NSUserDefaults on iOS and macOS, SharedPreferences on Android bu kısımlarda saklar temrary olarak tutar.
// Flutter Secure Storage Dataları = IOS'da keychain de android de EncryptedSharedPreferences' da tutar. Datalar uygulama silinsede silinmez dikkat.

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? preferenses;
  SharedManager() {
    // init(); Bu kısmı ilgili yapıda çağıralım
  }

  Future<void> init() async {
    preferenses = await SharedPreferences.getInstance();
  }

  void _checkPrefrences() {
    if (preferenses == null) {
      SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    // Verilerimizi cache'e koyuyoruz.
    _checkPrefrences();
    await preferenses?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPrefrences();
    return preferenses?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPrefrences();
    return (await preferenses?.remove(key.name)) ?? false;
  }
}

// Dummy Data

class User {
  final String name;
  final String surname;
  final String url;
  User({
    required this.name,
    required this.surname,
    required this.url,
  });
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User(name: "hasan", surname: "gursoy", url: 'pub.dev'),
      User(name: "hasan1", surname: "gursoy1", url: 'pub.dev'),
      User(name: "hasan2", surname: "gursoy2", url: 'pub.dev'),
      
    ];

  }
}
