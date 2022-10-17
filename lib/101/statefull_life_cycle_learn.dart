import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  // Müşteriden veriyi bir kere alıcaksak buraya yazıyoruz.
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd;

  // İlk çalışan state yapımızdır.
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print("init state");
  }

  void _computeName() {
    if (_isOdd) {
      _message += " Cift";
    } else {
      _message += " Tek";
    }
  }

  // State'in yaşamında çok büyük bir değişiklik olduğu zaman tetiklenir.
  // Pek kullanılmıyor ama var yani init stateden hemen sonra tetiklenir.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChange Dependencies");
  }

  // Üst sınıftan gelen veya kendisi için bir değişiklik olduğu anda devreye girer.
  // çok kullanılır örneği yapıcaz üst sınfdan gelen değer ile yapıcaz.
  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
    print("didUpdate");
  }

  // Sayfanın öldüğü zaman devreye giren abimizdir kendisi.
  @override
  void dispose() {
    super.dispose();
    print("Sayfa dispose edildi.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: widget.message.length.isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
