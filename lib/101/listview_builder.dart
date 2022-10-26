import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) { return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded(child: Image.network("https://picsum.photos/200")),
                    const Text("Hello World")
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.white,
              );
            },
            itemCount: 15));
  }
}
