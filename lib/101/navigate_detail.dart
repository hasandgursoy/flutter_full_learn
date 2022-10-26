import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({super.key, this.isOkey = false});
  final bool isOkey;

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearn();
}

class _NavigateDetailLearn extends State<NavigateDetailLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              // En kolay ve tatlı yöntem sayfadan çıkıldığındaki veri aktarım yöntemi budur pop() içinde veri göndermek.
              return Navigator.of(context).pop(true);
            },
            icon: const Icon(Icons.check),
            label: widget.isOkey ? const Text("Trused") : const Text("Check")),
      ),
    );
  }
}
