import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_full_learn/303/testable/image_picker_generic.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                context.navigateToPage(const ImagePickerGenericView(),
                    type: SlideType.RIGHT);
              },
              child: Text("Kartal", style: context.textTheme.headline1)),
          Icon(context.isIOSDevice ? Icons.abc_sharp : Icons.access_alarm),
          AnimatedContainer(
            duration: context.durationLow,
            child: Container(
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.15),
              color: Colors.blueAccent,
            ),
          ),
          // Keyboard Açılması için CMD + K' ya basıcaz.
          const TextField(
            keyboardType: TextInputType.numberWithOptions(),
            keyboardAppearance: Brightness.dark,
            enabled: true,
          ),
        ],
      ),
    );
  }
}
