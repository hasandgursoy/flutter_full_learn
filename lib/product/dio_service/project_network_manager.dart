import 'package:dio/dio.dart';

class ProjectNetworkManager {
  late final Dio _dio;

  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}

// Aşşağıdaki kullanıma sahip olmak için bütün dava :D
// var instance = ProjectNetworkManager.instance._dio;

class DurationManager {
  DurationManager._();

  static DurationManager? _manager;

  static DurationManager get manager {
    if (_manager != null) {
      return _manager!;
    }

    _manager = DurationManager._();
    return _manager!;
  }
}
