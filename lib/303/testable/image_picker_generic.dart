import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_full_learn/product/utility/image_upload.dart';
import 'package:flutter_full_learn/product/utility/image_upload_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({super.key});

  @override
  State<ImagePickerGenericView> createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  late final ImageUploadSolidManager _solidImageUploadManager;

  @override
  void initState() {
    // Interface'den türettiğimiz yapılardan birini parametre olarak alabiliyor.
    // ImageUploadSolidManager'a gidip bakabilirsin.
    _solidImageUploadManager = ImageUploadSolidManager(GalleryImageUpload());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _solidImageUploadManager.cropWithFetch();
            },
            child: Text("Fetch From Gallery"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Fetch From Gallery"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Fetch From Gallery"),
          )
        ],
      ),
    );
  }
}
