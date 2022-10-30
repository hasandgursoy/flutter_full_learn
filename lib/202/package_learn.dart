import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package/loading_bar.dart';

// Normalde aşşağıdaki yapıya mixin verirdik yada class'ı ama LaunchMixin'i sınırlandırdık sadece statefullwidget için kullanılabilir hale getirdik.
class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  late final String uri;
  @override
  void initState() {
    uri = 'https://pub.dev/packages/url_launcher';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        // Bu aşşağıdaki tanımlamayı ben light_theme'in içinde yaptım.
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          launchUrlFunc(uri);
        },
        child: const Icon(Icons.class_outlined),
      ),
    );
  }
}
