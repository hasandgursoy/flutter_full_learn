import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const _CustomCard(
              child: SizedBox(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Text('Click MEEE'),
              ),
            ),
          )),
          Card(
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).colorScheme.onSurface,
            child: const SizedBox(
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

// Borders
// StadiumBorder(),CirclerBorder(),RoundedRectangleBorder()

class _CustomCard extends StatelessWidget {
  const _CustomCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        color: Theme.of(context).colorScheme.onTertiary,
        shape: const StadiumBorder(),
        child: child);
  }
}

// Bütün cardların shape'inin borderradiusunu Main den değiştirebiliriyoruz.