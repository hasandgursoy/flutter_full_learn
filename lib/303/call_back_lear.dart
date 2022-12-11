// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

// Büyük bir sayfa yaptığımızı düşünün bu sayfada bir sürü logic çalışacak biz hepsini aynı yere koyarsak ne olur 'KAOS'
// Bu durumu yaşamamak için ne yapmamız lazım atomik düşünmemiz lazım bunun için bu konu ile alakalı product/ widget klasörünün içine bak.

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  CallBackUser? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(
            onUserSelected: (user) {
              print(user);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number % 2 == 0;
            },
          ),
          LoadingButton(
            title: 'save',
            onPressed: () async {
              const Duration(seconds: 1);
            },
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final String id;

  CallBackUser(this.name, this.id);

  // TODO : Dummy Remove It
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser("hasan", "1"),
      CallBackUser("ali", "2"),
      CallBackUser("furkan", "  3"),
    ];
  }

  // Null olma durumuna karşı bir == ifadesi yönetimi gerçekleştiriyoruz.
  // Listelerin çalışma mantığına göre içinde veriler aynı referansı tutar bu yüzden eşitlik hatası alıyoruz.
  // Biz aşşağıda diyoruz ki referansının aynı olmasına değil ismin ve id nin eşitliğini kontrol et.
  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
