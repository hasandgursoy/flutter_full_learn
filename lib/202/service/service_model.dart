// Bu Model Şekli Önemli
// Json To Dart
// Dio'yu kurmayı unutma

class ServicePostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ServicePostModel({this.userId, this.id, this.title, this.body});

  ServicePostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

// Asla Buraya Kod Yazılmaz !!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
