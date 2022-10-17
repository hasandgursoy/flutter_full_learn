import 'package:flutter/material.dart';

import '../core/random_image.dart';

class ListTileLEarn extends StatelessWidget {
  const ListTileLEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              // Bu yapıyı core dosyasına taşıdık çünkü alakasız bir şekilde bu yapıda url vs alıyordu ve bu
              // projeye özgü bir yapı değildi heryerde kullanılabilir gelmesi gerekiyordu
              // başka projelerde de kullanılabilir hale gelmesi için yaptık.
              title: const RandomImageComponent(height: 100),
              //dense: true, komponent'i oldukça sıkıştırmaya yarıyor.
              onTap: () {},
              subtitle: Text('How do you use your card ? '),
              leading: Icon(Icons.money),
              trailing: Icon(Icons.chevron_right),
            ),
          )
        ],
      ),
    );
  }
}
