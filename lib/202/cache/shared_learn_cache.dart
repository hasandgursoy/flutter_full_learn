import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({super.key});

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends SharedLoading<SharedLearnView> {
  int _currentValue = 0;
  late final SharedManager preferences;

  @override
  void initState() {
    preferences = SharedManager();
    _intiliazie();
    super.initState();
  }

  void _onChangeValue(String? value) {
    if (value != null) {
      setState(() {
        _currentValue = int.tryParse(value) ?? 0;
      });
    }
  }

  Future<void> _intiliazie() async {
    await preferences.init();
    _sharedPref();
  }

  Future<void> _sharedPref() async {
    // Shared paketinin bir yazımı bu paketi cache için kullanıyoruz.
    // Daha önce cache koyduğumuz veriyi çekiyoruz.

    _onChangeValue(preferences.getString(SharedKeys.counter) ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              // SizedBox.shrink() kaplayabileceği en küçük alanı kapla demek.
              : const SizedBox.shrink()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_addPreferences(), _removePreferences()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(
            child: _ListViewUserCacheWidget(),
          )
        ],
      ),
    );
  }

  FloatingActionButton _addPreferences() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        changeLoading();
        preferences.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removePreferences() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        // Verilerimizi cache'e koyuyoruz.
        preferences.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

class _ListViewUserCacheWidget extends StatelessWidget {
  _ListViewUserCacheWidget({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
          title: Text(users[index].name),
          subtitle: Text(users[index].surname),
          trailing: Text(
            users[index].url,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(decoration: TextDecoration.underline),
          ),
        ));
      },
    );
  }
}

abstract class SharedLoading<T extends StatefulWidget>
    extends State<SharedLearnView> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
