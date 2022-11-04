// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';

// T sadece FileItem türünden birşey olabilir dedik.
class FileDownload<T extends FileItem> {
  void downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem({
    required this.name,
    required this.file,
  });
}

abstract class IFileDownload {
  void shareToFile(String path);
}

// Mixin'in sadece IFileDownload yapısına sahip yerlerde kullanılmasını kural koyabiliyoruz. On ile :D 
mixin ShareMixin on IFileDownload {
  void selamMudur();
}
