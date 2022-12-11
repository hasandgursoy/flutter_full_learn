
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/models/image_upload.dart';

class ImageUploadService {
  final Dio dio;
  // https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/full%2Fvb.png
  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadToImageServer(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    var formData =
        FormData.fromMap({'file': MultipartFile.fromBytes(byteArray)});
    final response = await dio.post(
      'path',
      data: formData,
      onSendProgress: onSendProgress,
    );

    if (response.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response.data ?? '');
    }
  }
}
