import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/models/image_upload.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_modal.g.dart';

class ImageUploadViewModal = _ImageUploadViewModalBase
    with _$ImageUploadViewModal;

abstract class _ImageUploadViewModalBase with Store {
  File? file;
  @observable
  String imageUrl = '';

  // Değiştiğini ekranda dinlemek istiyorsak @observable diyoruz
  @observable
  bool isLoading = false;

  @observable
  String downloadText = '';

  static const String _baseUrl =
      'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/';
  ImageUploadService imageUploadService =
      ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  // Ekrana haber vericeksek değişikliği @action olarak tanımlıyoruz.

  @action
  void updateDownloadText(int send, int total) {
    downloadText = '$send / $total';
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl = _baseUrl + (response.name?.replaceFirst("/", "%2F") ?? '');
  }

  void init() {}
  @action
  void saveLocalFile(XFile? file) {
    this.file = File(file?.path ?? '');
  }

  Future<void> saveDataToService() async {
    if (file == null) return;
    final resposne = await imageUploadService.uploadToImageServer(
        await file!.readAsBytes(), 'vb', onSendProgress: (send, total) {
      updateDownloadText(send, total);
    });
    uploadImageUrl(resposne);
  }
}
