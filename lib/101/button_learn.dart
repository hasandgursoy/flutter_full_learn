import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('Click Me')),
          const ElevatedButton(onPressed: null, child: Text('Click Me')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Click Me'),
          ),
          InkWell(
              onTap: () {},
              onTapCancel: () {},
              onDoubleTap: () {},
              onHover: (value) {},
              child: const Text('Custom Click Me')),
          // Style İçin Çok Yeni Bir Yöntem Ancak Daha İyisi Var.
          TextButton(
            onPressed: () {
              // Servise İstek At
              // Sayfanın Rengini Düzenle
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.white;
            })),
            child: const Text('Style Text Button'),
          ),
          OutlinedButton(
            onPressed: () {},
            // Bu Daha Kaliteli Bir Yöntem
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                //shape: const CircleBorder(),
                padding: const EdgeInsets.all(10)),
            child: const SizedBox(width: 200, child: Text('Kaliteli Style')),
          ),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('data')),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,right: 40,left: 40),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// 1. TEXT BUTTON
// 2. ICON BUTTON
// 3. FLOATING ACTION BUTTON
// 4. OUTLİNED BUTTON
// 5. INKWELL

// Borders
// CircleBorder(),RoundedBorder();

// Button Style
// Her Button'un Icon yapısı oluyor
// Her Button'un style yapısı oluyor ve buna
// ButtonName.styleFrom() şeklinde ulaşabiliyoruz. 
// İkinci Yöntem 
// style : ButtonStlye() diyip MaterialState den ulaşabiliyoruz.

