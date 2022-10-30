// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class PostModel2 {
  String? title;
  String? body;
  int? userId;
  int? id;
}

class PostModel3 {
  String title;
  String body;
  int userId;
  int id;

  PostModel3(this.title, this.body, this.id, this.userId);
  
}

class PostModel1 {
  final String title;
  final String body;
  final int userId;
  final int id;

  PostModel1(this.title, this.body, this.userId, this.id);
}

class PostModel4 {
  final String title;
  final String body;
  final int userId;
  final int id;

  PostModel4(
      {required this.title,
      required this.body,
      required this.userId,
      required this.id});
}

class PostModel5 {
  final String _title;
  final String _body;
  final Int _userId;
  final Int _id;

  PostModel5(
      {required String title,
      required String body,
      required Int userId,
      required Int id})
      : _title = title,
        _body = body,
        _userId = userId,
        _id = id;
}

class PostModel6 {
  late final String _title;
  late final String _body;
  late final int _userId;
  late final int _id;

  PostModel6(
      {required String title,
      required String body,
      required int userId,
      required int id}) {
    _title = title;
    _body = body;
    _userId = userId;
    _id = id;
  }
}

class PostModel7 {
  late final String _title;
  late final String _body;
  late final int _userId;
  late final int _id;


  PostModel7(
      {String title = "", String body = "", int userId = 0, int id = 0}) {
    _title = title;
    _body = body;
    _userId = userId;
    _id = id;
  }
  
}

// Data Bir Servisden geliyorsa Olması gereken bu olmalı

class PostModel8 {
  final String? title;
  String? body;
  final int? userId;
  final int? id;

  PostModel8({this.title, this.body, this.userId, this.id});

  void updateData(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    String? title,
    String? body,
    int? userId,
    int? id,
  }) {
    return PostModel8(
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }
}
