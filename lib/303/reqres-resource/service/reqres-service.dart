import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres-resource/models/resource_model.dart';

abstract class IReqresService {
  final Dio dio;
  IReqresService(this.dio);

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath {users}

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get("/${_ReqResPath.users.name}");
    if (response.statusCode == HttpStatus.ok) {
      final jsonbody = response.data;

      if (jsonbody is Map<String,dynamic>) {
        return ResourceModel.fromJson(jsonbody); 
      }
    }
    return null;
  }
}
