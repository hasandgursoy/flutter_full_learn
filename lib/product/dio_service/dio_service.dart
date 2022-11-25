import 'package:dio/dio.dart';

mixin DioServiceMixin {
  final dioService = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

}
