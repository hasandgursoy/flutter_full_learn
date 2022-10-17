import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final String name = 'Markus';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Name $name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
          ),
          // Yukarıdakinden çok daha doğru bir hal
          Center(
            child: Text(
              " $name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ProjectColors.welcomeColor),
            ),
          )
        ],
      ),
    );
  }
}

// 1. Yol ama çok basic yol widgetları ayırmak için fonksiyonel hale getirmek için.
class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.yellowAccent;
}

class ProjectKeys {
  static String welcomeText = "Welcome";
}
