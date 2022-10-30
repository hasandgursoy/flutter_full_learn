// Mixinlerden yeni bir sınıf üretilemez
import 'package:url_launcher/url_launcher.dart';

// Mixin yapısını on ClassName diyerek yada Widget diyerek sınırlandırabiliyoruz.
// Stls Stful farketmiyor istediğimiz şekilde sınırlandırabiliyoruz.

mixin LaunchMixin {
  
  Future<void> launchUrlFunc(String url) async {
    final uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      
    }
  }

}