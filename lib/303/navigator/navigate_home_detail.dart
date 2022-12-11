import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
   String? _id;
  @override
  void initState() {
    super.initState();
    // ModalRoute yapısı diğer sayfalar gönderdiğimiz verileri yakalamızı sağlar.
    //Ekran drawing'i bittikden sonra çizilir o yüzden microtask içinde çağırılmalı.
    Future.microtask(() {
      final args = ModalRoute.of(context)?.settings.arguments as Map;
      final modelId = args['HomeData'];
      setState(() {
        _id = modelId is String ? modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
