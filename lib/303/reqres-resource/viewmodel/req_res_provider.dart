import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres-resource/service/reqres-service.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';

import '../models/resource_model.dart';

// Bu yapının bir ekrana haber vereceğini söylemek için ChangeNotifier olarak extends etmemiz gerek provider için.
class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners(); // ekrana haber veriyor.
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
