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
              return  UpdateDialog(context: context,);
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
