import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres-resource/viewmodel/req_res_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// Logicleri artık ReqResViewModel yöneticek.
class _ReqResViewState extends ReqResViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Text(resources[index].firstName ?? "");
        },
      ),
    );
  }
}
