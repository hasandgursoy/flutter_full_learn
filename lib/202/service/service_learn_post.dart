
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';
import 'package:flutter_full_learn/202/service/service_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final IPostService _postService;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _postService = PostService();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(ServicePostModel postmodel) async {
    changeLoading();
    final response = await _postService.addItemToService(postmodel);
    print(response);
    changeLoading();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              // Sonra ki satıra geç dedik.
              textInputAction: TextInputAction.next,
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            TextField(
              controller: _userIdController,
              // Eğer number bir değer alacaksak number klavyenin açılmasını sağlayabiliriz.
              keyboardType: TextInputType.number,
              // Input formatters'ı öylesine yazdım tekrarda daha güzel bir halini yazarım.
              // Hangi karakterlerin girilip girilmeyeceğini söyüyoruz.
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  return newValue;
                })
              ],
              // Auto tamamlarken yapılması gereken tamamlamalar için aşşağıya yapılar ekleyebiliyoruz.
              autofillHints: const [AutofillHints.creditCardName],
              decoration: const InputDecoration(labelText: 'UserId'),
            ),
            TextButton(
              // _isLoading best Practice
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = ServicePostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        var deger = _addItemToService(model);
                      }
                    },
              child: const Text("Kontrol Et"),
            )
          ],
        ),
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
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
