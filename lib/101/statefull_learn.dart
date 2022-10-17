import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';

// Yaşam döngüsüne ihtiyacımız olduğu bütün yapılar statefull olmalıdır.
// Her yaşam döngüsüne ihtiyaç duyacak yapıyı ayırmaz isek main statefull yapısı defalarca tetiklenir. Bu uygulamayı mahf eder.
// setState methodu buildContext'i baştan çizer o yüzden main compnent de bunu bulundurmak yerine widget'ların yaşamlarından ihtiyaç halinde çağırmalıyız.

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) {
    isIncrement ? _countValue++ : _countValue--;
    // setState methodu build methodunu her çağırıldığında build methodunu tetikler.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text(
            "$_countValue",
            style: Theme.of(context).textTheme.headline2,
          )),
          const Placeholder(),
          const CounterHelloDart(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_incrementButton(), _deincrementButton()],
      ),
    );
  }

  Padding _incrementButton() {
    print("burada");
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(true);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  FloatingActionButton _deincrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: const Icon(Icons.remove),
    );
  }
}
