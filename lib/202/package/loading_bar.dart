import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key,this.size, this.color});
  final double? size;
  final Color? color;

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: widget.color ?? Colors.white,
      size: widget.size ?? 0,
      // vsync gördüğümüz yerde TickerProviderStateMixin'i import edelim.
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
