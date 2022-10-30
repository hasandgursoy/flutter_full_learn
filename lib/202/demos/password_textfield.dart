import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: const [AutofillHints.password],
      // Girilen değeri gizleme
      obscureText: _isSecure ? true : false,
      obscuringCharacter: '=',
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'Password',
        // Visibility  = göz işareti çıkarıyor. Şifre'yi görmek için ona basınca açılsın flan
        suffix: _onVisibilityAnimated(),
      ),
    );
  }

// _onVisibility fonksiyonunu aşşağıda bir daha yapıcam bu farklı olacak birazdaha animasyonda olacak.
  IconButton _onVisibility() {
    return IconButton(
      icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        _changeLoading();
      },
    );
  }

  IconButton _onVisibilityAnimated() {
    return IconButton(
      // Mümkün olduğunda outlined yapısını kullanalım.
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState:
            _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 1),
      ),
      onPressed: () {
        _changeLoading();
      },
    );
  }
}
