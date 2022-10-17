import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

// PageView controller'ını bir değişken haline getiriyoruz ve kendi state'ini kendisi yönettiği için
// setState dememize gerek kalmıyor harika bir yapı.

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final PageController _pageController = PageController(viewportFraction: 0.90);

  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(_currentPageIndex.toString()),
          )),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility()._durationLow,
                    curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_left),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: _DurationUtility()._durationLow,
                  curve: Curves.slowMiddle);
            },
            child: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        onPageChanged: _updatePageIndex,
        // PadEnds = true default tanımlıdır false yapınca en soldan başlatır sayfayı.
        padEnds: false,
        // Sonraki sayfanın ön izlemesini getirir ufak bir trick
        controller: _pageController,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}

class _DurationUtility {
  final _durationLow = const Duration(seconds: 1);
}
