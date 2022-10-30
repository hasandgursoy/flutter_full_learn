import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/202/service/service_model.dart';

import 'comment_model.dart';

// Bu sınıfı neden yaptık diye düşünüyorsak şöyle anlatayım.
// Bir View Sınıfında Dio olmaz base url olmaz service ile ilgili bir işlem varsa
// Service ile ilgi bir sınıf oluşturup ordan yönetmek çok daha mantıklı ve sürdürülebilir.

abstract class IPostService<T> {
  Future<List<T>?> fetchItems();
  Future<bool> addItemToService(ServicePostModel postmodel);
  Future<bool> putItemToService(ServicePostModel postmodel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fetchCommentsValuesWithPostId(int? postId);
}

class PostService implements IPostService<ServicePostModel> {
  final Dio _dio;

  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<List<ServicePostModel>?> fetchItems() async {
    final response = await _dio.get(_PostServicePaths.posts.name);
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => ServicePostModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<bool> addItemToService(ServicePostModel postmodel) async {
    // Try-Catch Yapısına örnek olsun diye yaptım normalde ihtiyaç yoktu.
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postmodel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(ServicePostModel postmodel, int id) async {
    // Try-Catch Yapısına örnek olsun diye yaptım normalde ihtiyaç yoktu.
    try {
      final response = await _dio.put("${_PostServicePaths.posts.name}/$id",
          data: postmodel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    // Try-Catch Yapısına örnek olsun diye yaptım normalde ihtiyaç yoktu.
    try {
      final response = await _dio.delete(
        "${_PostServicePaths.posts.name}/$id",
      );
      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchCommentsValuesWithPostId(int? postId) async {
    final response = await _dio.get(_PostQueryPaths.comments.name,
        queryParameters: {_PostQueryPaths.postId.name: postId});
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => CommentModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}

// BaseUrl'den sonraki kısım
enum _PostServicePaths {
  posts,
  comments,
}

enum _PostQueryPaths { postId, comments }

class _ShowDebug {
  static void showDioError(DioError error) {
    if (kDebugMode) {
      print(error.message);
    }
  }
}
