import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter'da form componentleri yerine kullandığımız yapılardır.

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  String _message = "";

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            focusNode: focusNodeTextFieldOne,
            // Klavyenin açılma tipini düzenler mesela bu email e göre klavye açıcak.
            keyboardType: TextInputType.emailAddress,
            // Verilent hint e göre tamamlar mesela mail ise ona göre tamamlar.
            autofillHints: const [AutofillHints.email],
            // Text'in içindeki yapıyı kendimize göre formatlayabiliyoruz.
            // Yani eğer  istemediğimiz bir durum varsa adama yazdırmıyoruz.
            // Mesela biz "a" harfinin kullanılmasını istemiyoruz ona göre hareket ediyoruz.
            inputFormatters: [TextProjectInutFormatter()._formatter],
            onChanged: (value) {
              _message = value;
              setState(() {});
            },
            maxLength: 20,
            buildCounter: (context,
                {int? currentLength, bool? isFocused, maxLength}) {
              return _animatedContainer(
                message: _message,
                currentLength: currentLength,
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              hintText: "Mail",
              labelText: "Mail"

              // background color
              // fillColor: Colors.white,
              // filled: true,
            ),
          ),
          TextField(focusNode: focusNodeTextFieldTwo,)
        ],
      ),

    );
  }
}

class _animatedContainer extends StatefulWidget {
  const _animatedContainer({
    Key? key,
    required String message,
    required this.currentLength,
  })  : _message = message,
        super(key: key);

  final String _message;
  final int? currentLength;

  @override
  State<_animatedContainer> createState() => _animatedContainerState();
}

class _animatedContainerState extends State<_animatedContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: 10.0 * (widget.currentLength ?? 0),
      color: Colors.greenAccent,
      child: Text(widget._message),
    );
  }
}

class TextProjectInutFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text.contains("a")) {
      return oldValue;
    }
    return newValue;
  });
}
