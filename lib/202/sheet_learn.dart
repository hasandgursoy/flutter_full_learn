import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView>
    with ProductSheetMixin {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_browser),
        onPressed: () async {
          var result = await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.deepOrangeAccent,
            // isScrollControlled true yapınca Modal'ın boyutuna etki edebiliyoruz. Column'ı SizedBox'a alıp hallederiz.
            isScrollControlled: true,
            // Modal'ın dışındaki kısmın rengi
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            barrierColor: Colors.blueGrey,
            builder: (context) {
              return const _BottomSheetModal();
            },
          );
          // Client bottomsheet 'i butona basmadan kapatırsa ne olacak diye sonucu incelemek için inspect'i incelemek güzel bir yöntem.
          inspect(result);
          if (result is bool) {
            setState(() {
              result
                  ? backgroundColor = Colors.indigo
                  : backgroundColor = Colors.white;
            });
          }
        },
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, const ListViewLearn());
          },
          child: const Text("Show"),
        ),
      ),
    );
  }
}

class _BottomSheetModal extends StatefulWidget {
  const _BottomSheetModal({
    Key? key,
  }) : super(key: key);

  @override
  State<_BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<_BottomSheetModal> {
  Color backgroundColor = Colors.transparent;
  late bool _isBool;
  final _gripHeight = 30.0;

  @override
  void initState() {
    _isBool = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _gripHeight,
            child: Stack(alignment: Alignment.topCenter, children: [
              Divider(
                color: Colors.black,
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.42,
                endIndent: MediaQuery.of(context).size.width * 0.45,
              ),
              Positioned(
                  right: 10,
                  top: 0,
                  child: InkWell(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.close),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))
            ]),
          ),
          const Text('Imaginary Image'),
          Image.network('https://picsum.photos/200'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _isBool = !_isBool;
                });
                // Generic Bir Yapı Olduğu İçin İstediğimizi Dönebiliyoruz.
                Navigator.of(context).pop<bool>(_isBool);
              },
              child: const Text('Ok'))
        ],
      ),
    );
  }
}

// 1. Adım
mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

// 2. Adım
class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const _BaseSheetHeader(), Expanded(child: child)],
      ),
    );
  }
}

// 3. Adım
class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 30,
        super(key: key);

  final double _gripHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(alignment: Alignment.topCenter, children: [
        Divider(
          color: Colors.black,
          thickness: 3,
          indent: MediaQuery.of(context).size.width * 0.42,
          endIndent: MediaQuery.of(context).size.width * 0.45,
        ),
        Positioned(
            right: 10,
            top: 0,
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.close),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ))
      ]),
    );
  }
}
