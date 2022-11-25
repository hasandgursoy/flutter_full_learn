import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // Sadece verilen tek yeri kaplasın bir satırsa bir satır.
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.green,
            height: 300,
          ),
          const Divider(),

          // Yana Doğru kayan ListView
          SizedBox(
            height: 300,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                color: Colors.red,
                width: 200,
              ),
              Container(
                color: Colors.pink,
                width: 200,
              ),
              Container(
                color: Colors.purple,
                width: 200,
              ),
            ]),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          // xxxxxxxxxxxxxxxxxx
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.green,
            height: 300,
          ),
          const Divider(),

          // Yana Doğru kayan ListView
          SizedBox(
            height: 300,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                color: Colors.red,
                width: 200,
              ),
              Container(
                color: Colors.pink,
                width: 200,
              ),
              Container(
                color: Colors.purple,
                width: 200,
              ),
              const _ListDemoState()
            ]),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}

class _ListDemoState extends StatefulWidget {
  const _ListDemoState();

  @override
  State<_ListDemoState> createState() => __ListDemoStateState();
}

class __ListDemoStateState extends State<_ListDemoState> {
  @override
  void initState() {
    super.initState();
    print("State Initiliaze Edildi.");
  }

  @override
  void dispose() {
    super.dispose();
    print("State Dispose Edildi.");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
