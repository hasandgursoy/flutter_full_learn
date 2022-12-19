import 'package:image_picker/image_picker.dart';

// Güzel Bir SOLID prensiplerine uygun bir yapı kurduk şuan daha çok sevdim vb'yi 
// Abstract bir yapı kurduk sonra bunun func larını miras alanlarda override ettik 
// Bir tane sonra bir tane ara sınıf yazdık bunların arasındaki bağlantıyı kuracak bir sınıf.
// Tek işi IImageUpload'ı miras alan yapıları tek func'da dönmek ola bu kadar basit.
//  Interface'i oluştur - Kalıtım Aldır - Tek yapı içinde kullan.

abstract class IImageUpload {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> fetch();
}

class ImageUploadSolidManager {
  final IImageUpload imageUpload;

  ImageUploadSolidManager(this.imageUpload);

  Future<XFile?> cropWithFetch() async {
    return await imageUpload.fetch();
  }
}

class GalleryImageUpload extends IImageUpload {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class CameraImageUpload extends IImageUpload {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
