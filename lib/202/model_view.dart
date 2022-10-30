import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelViewDart extends StatefulWidget {
  const ModelViewDart({super.key});

  @override
  State<ModelViewDart> createState() => _ModelViewDartState();
}

class _ModelViewDartState extends State<ModelViewDart> {
  PostModel8 user5 = PostModel8(body: " ");

  @override
  void initState() {
    super.initState();

    final user1 = PostModel2()
      ..userId = 0
      ..body = ""
      ..id = 0
      ..title = "";

    final user2 = PostModel3("", "", 1, 1);

    final user3 = PostModel1("", "", 1, 1);

    final user4 = PostModel4(title: "", body: "", userId: 1, id: 1);

    // Bla Bla şeklinde gidiyor çok umursama zaten OOP biliyosun halledersin
    // Ama dersenki gerçekten ne lazım servisden gelen dataları yakalamak için model8 iyidir.
    // Service
    // var user5 = PostModel8(body: " ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          user5 = user5.copyWith(title: "Data is full");
          user5.updateData(null);
        },
      ),
      appBar: AppBar(
        title: Text(user5.title ?? "Not has any data"),
      ),
    );
  }
}
