import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_manage_learn.dart';

class StateLearnView extends StatefulWidget {
  const StateLearnView({super.key});

  @override
  State<StateLearnView> createState() => _StateLearnViewState();
}

class _StateLearnViewState extends CustomStateManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpacitiy();
        },
      ),
      body: Column(
        children: [
          Container(
              height: 300,
              width: 200,
              color: isOpacitiy ? Colors.amber : Colors.red)
        ],
      ),
    );
  }
}
