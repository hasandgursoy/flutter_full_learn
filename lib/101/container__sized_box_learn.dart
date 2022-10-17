import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
            constraints: const BoxConstraints(maxWidth: 100, minWidth: 150),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(width: 10, style: BorderStyle.solid),
                boxShadow: const [
                  BoxShadow(color: Colors.black38, offset: Offset(0.1, 1)),
                ],
                gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.indigoAccent]),
                borderRadius: BorderRadius.circular(10)),
            child: Text('aa' * 2),
          ),
        ],
      ),
    );
  }
}

// 2 farklı kullanım şekli olabilir 
// 1. Method'un ismini değiştirip istenilen yapıdan extends edilip kullanılabilir.
// 2. Static bir yapıdan değişken oluşturur gibi oluşturulup çağırılabilir.

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.amber,
      border: Border.all(width: 10, style: BorderStyle.solid),
      boxShadow: const [
        BoxShadow(color: Colors.black38, offset: Offset(0.1, 1)),
      ],
      gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.indigoAccent]),
      borderRadius: BorderRadius.circular(10));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            color: Colors.amber,
            border: Border.all(width: 10, style: BorderStyle.solid),
            boxShadow: const [
              BoxShadow(color: Colors.black38, offset: Offset(0.1, 1)),
            ],
            gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.indigoAccent]),
            borderRadius: BorderRadius.circular(10));
}
