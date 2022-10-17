import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String _title = 'WelcomeLearn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarTextStyle: const TextStyle(color: Colors.red),
        // Backbutton otomatik olarak gelmesin diye aşşağıdaki yapı var.
        automaticallyImplyLeading: false,
        leadingWidth: 23,
        actionsIconTheme: const IconThemeData(color: Colors.amberAccent),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_email_read_sharp),
          ),
          //const Center(child: CircularProgressIndicator(),),
        ],
      ),
      body: Column(children: const []),
    );
  }
}
