import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/listview_builder.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

import '../202/service/service_model.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

// AutomaticKeepAliveClientMixin yapısı var olan state'imizi sayfalar değiştiğinde kaybetmemizi sağlıyor. Tabbar da değişsen sayfalar bir örnek mesela.
// widget.build edildikten hemen sonra super.build(context)'i veriyoruz ve bir tane methodunu override ediyoruz.
// _setState çağırıldığında ne olacağını sorarsak onunda çözümü var
class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  final PostService _postService = PostService();
  late final Future<List<ServicePostModel>?> _itemFuture;

  @override
  void initState() {
    _itemFuture = _postService.fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<ServicePostModel>?>(
        future: _postService.fetchItems(),
        builder: (context, snapshot) {
          // Snapshot çok değerli çünkü connection state ile internet yokken, bekledğinde,aktivken ve bittiğinde ne olması gerketiğini söyleyebiliyoruz.
          // switch yazdıktan sonra snapshot.connectionState parantez içine verip alt kısmını silersek otomatik olarak yapar gerisini.
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Placeholder();
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(snapshot.data?[index].body ?? ''),
                    ));
                  },
                );
              } else {
                return const Placeholder();
              }
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
