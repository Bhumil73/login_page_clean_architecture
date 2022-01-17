class User {
  int? id;
  String? name;
  String? username;

  User({required this.id, required this.name, required this.username});

  User.initial()
      : id = 0,
        name = '',
        username = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
