import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearnView extends StatefulWidget {
  const AlertLearnView({super.key});

  @override
  State<AlertLearnView> createState() => _AlertLearnViewState();
}

class _AlertLearnViewState extends State<AlertLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await showDialog(
            // Barier de bir yere tıklayınca dialog'un kapanmasını engeller.
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return _ImageZoomDialog();
            },
          );
          inspect(result);
        },
      ),
      body: const Center(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Version Update"),
      actions: [
        ElevatedButton(onPressed: () {}, child: const Text("Update")),
        TextButton(
            onPressed: () {
              // Navigator.Pop ile context'in yanındaki değer bize dönene değerdir.
              Navigator.pop(context, true);
            },
            child: const Text("Close")),
      ],
    );
  }
}

// AlertDialog'dan direk olarak miras alarak bu kodu daha performanslı hale getirebiliriz.
// Bunu her durumda yapamayız eğer mantık kurmayacaksak ve sadece birşeyler gösterip çıkacaksak yapmalıyız.
class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text("Version Update"),
          actions: [
            ElevatedButton(onPressed: () {}, child: const Text("Update")),
            TextButton(
                onPressed: () {
                  // Navigator.Pop ile context'in yanındaki değer bize dönene değerdir.
                  Navigator.pop(context, true);
                },
                child: const Text("Close")),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Stack(children: [
        // InteractivViewer = Ekranın parmaklarımızla küçültüp büyültmeye yarar. 
        InteractiveViewer(
          child: Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.cover,
            height: 400,
          ),
        ),
        Positioned(
            top: 0.1,
            right: 0.2,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context, "selam Hasan");
                },
                icon: Icon(Icons.close)))
      ]),
    );
  }
}
