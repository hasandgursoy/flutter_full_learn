import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_learn_view.dart';

abstract class CustomStateManager extends State<StateLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacitiy = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacitiy() {
    setState(() {
      isOpacitiy = !isOpacitiy;
    });
  }
}
