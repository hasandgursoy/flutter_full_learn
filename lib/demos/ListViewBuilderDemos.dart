import 'package:flutter/material.dart';

class MyCollectionDemos extends StatefulWidget {
  const MyCollectionDemos({super.key});

  @override
  State<MyCollectionDemos> createState() => _MyCollectionDemosState();
}

class _MyCollectionDemosState extends State<MyCollectionDemos> {
  late List<CollectionModel> _items;

  @override
  void initState() {
    _items = [
      CollectionModel(
          imagePath: 'assets/mycollectiondemo.jpg',
          title: "AbstractArts",
          price: 3.4),
      CollectionModel(
          imagePath: 'assets/mycollectiondemo.jpg',
          title: "AbstractArts",
          price: 3.4),
      CollectionModel(
          imagePath: 'assets/mycollectiondemo.jpg',
          title: "AbstractArts",
          price: 3.4),
      CollectionModel(
          imagePath: 'assets/mycollectiondemo.jpg',
          title: "AbstractArts",
          price: 3.4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return CategoryCard(model: _items[index]);
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingTop,
      color: Colors.white24,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: Image.asset(_model.imagePath)),
              Padding(
                padding: PaddingUtility().paddingAll,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(_model.title), Text("${_model.price}")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}
class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 50);
  final paddingAll = const EdgeInsets.all(8.0);
}
