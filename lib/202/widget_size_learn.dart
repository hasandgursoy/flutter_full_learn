import 'package:flutter/material.dart';

class WidgetSizeLearnView extends StatefulWidget {
  const WidgetSizeLearnView({super.key});

  @override
  State<WidgetSizeLearnView> createState() => _WidgetSizeLearnViewState();
}

class _WidgetSizeLearnViewState extends State<WidgetSizeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSize.normalCardHeight.value(),
          color: Colors.cyan,
        ),
      ),
    );
  }
}

enum WidgetSize { normalCardHeight, circleProfileWidth }
// Enum' mımıza extension method yazarak 
extension WidgetSizeExtension on WidgetSize {
  double value() {
    switch (this) {
      case WidgetSize.normalCardHeight:
        return 60.0;
      case WidgetSize.circleProfileWidth:
        return 25.0;
    }
  }
}
