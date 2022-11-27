import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqres-resource/service/reqres-service.dart';
import 'package:flutter_full_learn/303/reqres-resource/viewmodel/req_res_provider.dart';
import 'package:flutter_full_learn/303/reqres-resource/viewmodel/req_res_view_model.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../../product/dio_service/dio_service.dart';
import '../models/resource_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// Logicleri artık ReqResViewModel yöneticek.
class _ReqResViewState extends State<ReqResView> with DioServiceMixin {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReqResProvider(ReqresService(dioService)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Build'in içinde değilsek watch etmemizin bir anlamı yok.
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<ReqResProvider>()
                        .saveToLocale(context.read<ResourceContext>());
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const ImageLearn202();
                    }));
                  },
                  child: const Icon(Icons.wordpress))
            ],
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : null,
          ),
          body: Column(
            children: [
              // Dynamicler aslında genericler anlamına geliyor selectorda o yüzden dilediğimiz gibi çağırabiliyoruz.
              Selector<ReqResProvider, bool>(
                builder: (context, value, child) {
                  return value ? const Placeholder() : const Text("");
                },
                selector: (context, provider) {
                  return provider.isLoading;
                },
              ),
              // Expanded vermeyince patlıyor lazım :D
              // Bu şekilde yapınca provider'ın gücü sayesinde sadece iligli kısım değişiklikten etkilenecektir.
              Expanded(
                child: _resourceListView(
                    context, context.watch<ReqResProvider>().resources),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (context, index) {
        // inspect(resources[index]);
        return Card(
            child: Column(
          children: [
            Image.network(items[index].avatar ?? ""),
            Text(items[index].firstName ?? ""),
          ],
        ));
      },
    );
  }
}
