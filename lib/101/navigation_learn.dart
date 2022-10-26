import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/listview_builder.dart';
import 'package:flutter_full_learn/101/navigate_detail.dart';

class NavigationLearnView extends StatefulWidget {
  const NavigationLearnView({super.key});

  @override
  State<NavigationLearnView> createState() => _NavigationLearnViewState();
}

class _NavigationLearnViewState extends State<NavigationLearnView>
    with NavigatiorManager {
  List<int> selectedItems = [];
  void addSelected(int index) {
    setState(() {
      selectedItems.add(index);
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModelRout.of(context).settings.arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_rounded),
        onPressed: () async {},
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // TextButton içinde bir dünya oluşturduk ve her yapının bir index'i var tıkladığımızda bu index addSelect'e ekleniyor.
          
          return TextButton(
              onPressed: () async {
                // Generic bir yapı kurduk ve async olarak işaretlediğimiz bir yapıda ilgili yapı dispose edildiğinde
                // bize kendisinden verilen değeri döner. response yapısı bu açıklamanın uygulanmış halidir.
                final response = await navigateToWidget<bool>(
                    context, const NavigateDetailLearn(isOkey: true,));

                if (response == true) {
                  addSelected(index);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Placeholder(
                  color:
                      selectedItems.contains(index) ? Colors.green : Colors.red,
                ),
              ));
        },
      ),
    );
  }
}

mixin NavigatiorManager {
  Future<T?> navigateToWidget<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        // fullscreenDialog = native ortamdaki gibi açıl
        fullscreenDialog: true,
        builder: (context) {
          return widget;
        },
        // RouteSettings içerisinde veri gönderip alabiliyoruz ama güzel bir yöntem değil widget parametresi olarak al işte ne zorluyon.
        settings: const RouteSettings()));
  }
}
