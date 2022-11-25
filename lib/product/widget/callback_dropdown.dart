import 'package:flutter/material.dart';

import '../../303/call_back_lear.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({super.key, required this.onUserSelected});

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: _user,
      items: CallBackUser.dummyUsers().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e.name,
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      }).toList(),
      onChanged: _updateUser
    );
  }
}
