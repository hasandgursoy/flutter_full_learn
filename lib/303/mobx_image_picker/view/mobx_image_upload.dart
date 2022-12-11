import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/viewModel/image_upload_view_modal.dart';
import 'package:flutter_full_learn/product/utility/image_upload.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath =
      "https://assets2.lottiefiles.com/packages/lf20_urbk83vw.json";

  final _imageUploadViewModel = ImageUploadViewModal();
  final _imageUploadManager = ImageUploadManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _imageUploadViewModel.saveDataToService();
          },
          child: const Icon(Icons.save)),
      appBar: AppBar(
        title: const Text('Image Upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading
                ? const CircularProgressIndicator()
                : const SizedBox();
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10,
              // FittedBox doldur burayı demek gibi birşey
              child: FittedBox(
                  child: IconButton(
                icon: Lottie.network(_imageUploadLottiePath),
                onPressed: () async {
                  _imageUploadViewModel.saveLocalFile(
                      await _imageUploadManager.fetchFromLibrary());
                },
              )),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: Observer(
              builder: (_) {
                return _imageUploadViewModel.file != null
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.file(_imageUploadViewModel.file!))
                    : const SizedBox();
              },
            ),
          ),
          Expanded(child: Observer(
            builder: (_) {
              return _imageUploadViewModel.imageUrl.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(_imageUploadViewModel.imageUrl))
                  : const SizedBox();
            },
          ))
        ],
      ),
    );
  }
}
