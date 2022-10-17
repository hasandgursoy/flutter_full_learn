import 'package:flutter/material.dart';

class StatelessLearnView extends StatelessWidget {
  const StatelessLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const TitleText(title: 'Hasan'),
          const _CustomContainer(),
          _emptyBox()
        
        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10,);
}

// _ işareti dart dilinde private yapıda olduğunu söyler.
class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key, required this.title,
  }) : super(key: key);

  // Gelen veri null gelebilir bunu bildiricez
  // Ve gelen veri static bir veri ise değişmeyecekse final olarak işaretleyeceğiz.
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text("data", style: Theme.of(context).textTheme.headline3);
  }
}

// Her component'in her Widget'ın kendine özel bir build yapısı vardır.
// Biz bu build yapısının içinde widgetlarımızı geliştiririz.

// 3. TEMEL KURAL
// Complexite arttığında Widget'ı parçala.
// Dışarıdan parametre alabilir halde tasarla.
// Sayfalarımızda Private olarak tutmalıyız parçalanan widgetları.