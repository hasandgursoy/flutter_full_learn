import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, required this.postId});
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService _postService;
  bool _isLoading = false;
  List<CommentModel>? _models;

  @override
  void initState() {
    _postService = PostService();
    fetchItemWithId(widget.postId ?? 0);
    super.initState();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemWithId(int? postId) async {
    changeLoading();
    _models = await _postService.fetchCommentsValuesWithPostId(postId);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_models?[index].name ?? ""),
              leading: const Icon(Icons.mail),
              subtitle: Text(_models?[index].body ?? ""),
            ),
          );
        },
        itemCount: _models?.length ?? 0,
      ),
    );
  }
}
