
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comments_view.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';
import 'package:flutter_full_learn/202/service/service_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<ServicePostModel>? _items;
  String? name;
  bool _isLoading = false;
  // TEST edilebilir kod yazmak için interface ile DI sağlamamız gerekiyor.
  late final IPostService<ServicePostModel> postService;

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItems() async {
    changeLoading();
    _items = await postService.fetchItems();
    // print(response);
    changeLoading();
  }

// Bir kere çalışır ve async tanımlanmaz.
  @override
  void initState() {
    postService = PostService();

    fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ""),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return _CardComponent(model: _items?[index]);
        },
        itemCount: _items?.length ?? 0,
      ),
    );
  }
}

class _CardComponent extends StatelessWidget {
  const _CardComponent({
    Key? key,
    required ServicePostModel? model,
  })  : _model = model,
        super(key: key);

  final ServicePostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CommentsLearnView(postId: _model?.id);
          }));
        },
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
