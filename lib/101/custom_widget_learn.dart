import 'package:flutter/material.dart';

// Bu şekilde
class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Food";

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              // MediaQuery.of(context).size.width ile sayfanın genişliği kadar büyü dedik.
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(
                title: title, onPressed: () { },
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(16.0);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.title, required this.onPressed});
  final String title;
  // Bir Component'e onPress yeteneği kazandırmak.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(), backgroundColor: redColor),
      onPressed: () {},
      // Widget'ın Genişlemesini Sağladı.
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: whiteColor,
              ),
        ),
      ),
    );
  }
}
