import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  NoteDemos({super.key});
  final title = "Create your first note";
  final description = "Herksese selam umarım gününz güzel geçiyordur. " * 2;
  final _createNote = "Create a Note";
  final _importNote = 'Import Notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle:SystemUiOverlayStyle.dark ,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Center(
          child: Column(
            children: [
              PngImage(path: ImageItems().fluor),
              _TitleWidget(title: title),
              Padding(
                padding: PaddingItems.verticalPadding,
                child: _SubTitleWidget(
                  textAlign: TextAlign.center,
                  data: description,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    // Sizedbox'ın içine aldığımız yapının sayfayı komple kaplamasını istiyorsak center ile sarabiliriz içindeki yapıyı.
                  },
                  child: SizedBox(
                    height: ButtonHeights.buttonHeigt,
                    child: Center(
                      child: Text(
                        _createNote,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )),
              TextButton(onPressed: () {}, child: Text(_importNote)),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}

// Center Text Widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.data})
      : super(key: key);

  final TextAlign? textAlign;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ButtonHeights {
  static const double buttonHeigt = 50;
}
