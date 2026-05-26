class User {
  final int? id;
  final String? name;

  User({this.id, required this.name});

  factory User.fromMap(Map<String, dynamic> dataMap) {
    return User(id: dataMap["id"], name: dataMap["name"]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name};
  }
}