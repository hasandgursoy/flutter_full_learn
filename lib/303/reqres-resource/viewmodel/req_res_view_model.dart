import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/303/reqres-resource/models/resource_model.dart';
import 'package:flutter_full_learn/303/reqres-resource/service/reqres-service.dart';
import 'package:flutter_full_learn/product/dio_service/dio_service.dart';
import 'package:flutter_full_learn/product/dio_service/project_network_manager.dart';

import '../view/req_res_view.dart';

abstract class ReqResViewModel extends ChangeLoading<ReqResView>
    with DioServiceMixin {
  // late ile işaretlediğimiz için sadece initState de atayabiliyoruz.
  late IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    // dio service heryerden sürekli türetmeyelim diye product klasorunde oluşturduğum bir kısım.
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('hasan'); 
    _fetch();
    super.initState();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}

abstract class ChangeLoading<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
