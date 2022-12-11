import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('Best of list', () {
    List<GenericUser> users = [
      GenericUser("hasan", '11', 10),
      GenericUser("Yakup", "23", 30),
      GenericUser("Sezgin", "30", 40)
    ];

    var genericUser = users.lastWhereOrNull((element) => element.id == '5');
    print(genericUser);

    bool isRemoved = users.remove(GenericUser("asdasd", "2", 14));
    print(isRemoved);

    List<HighCard> highcards = users.map((e) {
      return HighCard(items: e.name.split(','));
    }).toList();

    try {
      users.singleWhere(
        (element) => element.findUserName('QQQ'),
        orElse: () {
          // Elementi print ettirmek istiyoruz diyelim gidip class'a toString methodunu override edeceğiz unutma.
          return GenericUser('name', '1', 1);
        },
      );
    } catch (e) {
      inspect(e);
    }
  });

  test('Best of collection', () {
    List<GenericUser> users = [
      GenericUser("hasan", '11', 10),
      GenericUser("Yakup", "23", 30),
      GenericUser("Sezgin", "30", 40)
    ];

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('hasan'),
    );
    // ToString methodunu ezdiğimiz için artık objeyi görebiliyoruz.
    print(response);
  });
}
