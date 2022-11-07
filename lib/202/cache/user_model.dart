class User {
  String? name;
  String? surname;
  String? url;

  User(this.name, this.surname, this.url);

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['url'] = url;
    return data;
  }
}
