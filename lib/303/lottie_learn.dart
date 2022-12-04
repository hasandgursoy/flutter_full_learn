import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/lottie_class.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearnView extends StatefulWidget {
  const LottieLearnView({super.key});

  @override
  State<LottieLearnView> createState() => _LottieLearnViewState();
}

//https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json
class _LottieLearnViewState extends State<LottieLearnView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    // vsync içindeki this'in hata vermemesi thickerproviderstatemixin eklemek gerekiyor.
    controller = AnimationController(
        vsync: this, duration: DuraitonItems.durationNoraml());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                // animateTo = ilk parametresi target yani animasyonun neresine kadar hareket edeceğini söyler
                // bunu iyi kurgulamak lazım 0 animasyonun en başı 1 ise en sonu.
                isLight ? controller.animateTo(1) : controller.animateTo(0);
                isLight = !isLight;
                context.read<ThemeNotifier>().changeTheme();

                // C# da ki gibi Task.Run gibi birşey yapabiliyoruz olleeyyy.
                Future.microtask(() => debugPrint("selamlar"));
              },
              child: Lottie.asset(LottieItems.lightDark.lottiePath,
                  repeat: false, controller: controller)),
        ],
      ),
      body: const _LottieNetworkAssets(),
    );
  }
}

class _LottieNetworkAssets extends StatelessWidget {
  const _LottieNetworkAssets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
          'https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json'),
    );
  }
}

// İlginç bir kullanım aşşağıya bırakıyorum
class DuraitonItems extends Duration {
  DuraitonItems.durationNoraml() : super(seconds: 1);
}
