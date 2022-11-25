class UserManagment<T extends AdminUser> {
  final T admin;

  UserManagment(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  List<int> calculateMoney(List<GenericUser> users) {
    if (admin.role == 1  ) {
      return throw Exception("Hata Yaptınız");
    }
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    // Bu yöntem yukarıdaki ile aynı işlemi yapıyor başlangıç değeri verip element değeri ile topluyor.
    // Ancak daha performanslı ve güzel bir yazımı var.
    final sumMoney = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    // Yukarıda ki ile aynı işi yapıyor :D
    final justSumWithFold = users.fold(
        0, (previousValue, element) => previousValue += element.money);

    print(sum);
    print(sumMoney);

    return [sum, sumMoney];
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(String name, String id, int money, this.role)
      : super(name, id, money);
}
