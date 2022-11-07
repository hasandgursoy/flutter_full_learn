import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLearn extends StatefulWidget {
  const SecureStorageLearn({super.key});

  @override
  State<SecureStorageLearn> createState() => _SecureStorageLearnState();
}

class _SecureStorageLearnState extends State<SecureStorageLearn> {
  final _storage = const FlutterSecureStorage();
  String data = '';

  @override
  void initState() {
    getSecureItem();
    super.initState();
  }

  void saveItems(String item) {
    setState(() {
      data = item;
    });
  }

  Future<void> getSecureItem() async {
    data = await _storage.read(key: Tokens.token.name) ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: Tokens.token.name, value: data);
          },
          label: const Text("Bana Bas")),
      body: TextField(
        onChanged: saveItems,
      ),
    );
  }
}

enum Tokens { token }
