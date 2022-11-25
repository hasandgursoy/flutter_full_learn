import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User Calculate', () {
    final users = [
      GenericUser("hasan", '11', 10),
      GenericUser("Yakup", "23", 30),
      GenericUser("Sezgin", "30", 40)
    ];

    final AdminUser admin = AdminUser("hasan", "2", 500, 1);

    final result = UserManagment(admin).calculateMoney(users);

    expect(result, [80, 20]);
  });
}
