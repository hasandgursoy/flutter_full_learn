import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
// Key prop' u aslında bir widget'a doğrudan ona erişip işlem yapmamıza yardımcı oluyor.

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print("Sürekli olarak değişikliği yakalar.");
        },
        child: Column(
          children: [
            // Bu yapıların controller yapısıda mevcut sakın unutma
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
              hint: const Text("İstanbul"),
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(
                  value: 'b',
                  child: Text('a'),
                ),
                DropdownMenuItem(
                  value: 'caa',
                  child: Text('b'),
                ),
                DropdownMenuItem(
                  value: 'eeee',
                  child: Text('c'),
                ),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("Okey");
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

// Validator yapısını aşşağıda tanımladık validator : FormFieldValidator().isNotEmpty yapısını kurduk. Ve messagı özel bir class dan çağırdık.
class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage()._notEmpty;
  }
}

class ValidatorMessage {
  final String _notEmpty = 'Boş Geçilemez.';
}
