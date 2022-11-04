import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  bool _isVisible = false;
  bool _isOpacitiy = false;
  late AnimationController _controller;
  List<String> havaDurumu = ["Güneşli", "Yağmurlu", "Rüzgarlı"];

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void __changeOpacitiy() {
    setState(() {
      _isOpacitiy = !_isOpacitiy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // İki widget arasındaki geçişini belli bir sürede gerçekleştirmeye yarıyor.
        title: _animatedCrossFateWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          // controller.forward ve reverse ile de sağlanabiliyor.
          _controller.animateTo(_isVisible ? 0 : 1);
        },
      ),
      body: Column(
        children: [
          // Sihirbaz gibi görünmez yapıyor.
          _animatedOpacitiyWidget(),
          // Bir yazının boyutunu büyütüyor.
          _animatedDefaultTextStyleWidget(context),
          // Hali hazırda bulunan iconların değişmesini sağlıyor örnek : home_list veya list_home controller'ına bak hatırlarsın.
          _animatedIconWidget(),
          // Animasyonlu container çizmemize yarıyor.
          _animatedContainerWidget(context),
          //
          Expanded(
              child: Stack(
            children: const [
              AnimatedPositioned(
                  top: 30,
                  duration: _DurationTimes.minDuration,
                  curve: Curves.easeInCirc,
                  child: Text("Selam")),
            ],
          )),
          // Bu widgetdan bir bok anlamadım.
          _animatedListWidget()
        ],
      ),
    );
  }

  Expanded _animatedListWidget() {
    return Expanded(
      child: AnimatedList(
        itemBuilder: (context, index, animation) {
          return Text(havaDurumu[index]);
        },
      ),
    );
  }

  AnimatedContainer _animatedContainerWidget(BuildContext context) {
    return AnimatedContainer(
      duration: _DurationTimes.minDuration,
      height: _isVisible ? 200 : MediaQuery.of(context).size.height * 0.2,
      width: _isVisible ? 200 : MediaQuery.of(context).size.height * 0.3,
      color: Colors.amber,
    );
  }

  AnimatedIcon _animatedIconWidget() =>
      AnimatedIcon(icon: AnimatedIcons.home_menu, progress: _controller);

  AnimatedDefaultTextStyle _animatedDefaultTextStyleWidget(
      BuildContext context) {
    return AnimatedDefaultTextStyle(
        style: _isVisible
            ? context.textTheme().headline2 ?? const TextStyle()
            : Theme.of(context).textTheme.subtitle1!,
        duration: _DurationTimes.minDuration,
        child: const Text("Data"));
  }

  ListTile _animatedOpacitiyWidget() {
    return ListTile(
      title: AnimatedOpacity(
          duration: _DurationTimes.minDuration,
          opacity: _isOpacitiy ? 0 : 1,
          child: const Text("Anahtara tıklarsan kaybolucam bascan mı ?")),
      trailing: IconButton(
        icon: const Icon(Icons.key),
        onPressed: () {
          __changeOpacitiy();
        },
      ),
    );
  }

  AnimatedCrossFade _animatedCrossFateWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      duration: _DurationTimes.minDuration,
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

// TextThemayı kısaltılmış halde yazdım harika la bu extension olayı.
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationTimes {
  static const Duration minDuration = Duration(seconds: 1);
}
