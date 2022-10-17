import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Samples'),
      ),
      body: const Text('merhaba'),
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 200,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ads_click_outlined), label: 'b')
        ],
      ),
    );
  }
}

// 1.DRAWER
// 2.FLOATING ACTION BUTTON
// 3.BOTTOM NAVİGATİON BAR
// 4.showModalBottomText

// TRCIKC !! = Eğer bir component widget alıyorsa istediğini koyabilirsin demektedir.