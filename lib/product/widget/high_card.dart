// Test klasorüne faydası olması için açıldı

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../303/generic_learn.dart';

class HighCard extends StatelessWidget {
  const HighCard({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text(items.join(','),style: Theme.of(context).textTheme.headline2,),
    );
  }
}
