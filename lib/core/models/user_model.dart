class User {
  int id;
  String name;
  String email;
  String shopType;
  String lastLogin;
  String memberSince;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.shopType,
    required this.lastLogin,
    required this.memberSince,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        shopType: json['shopType'],
        lastLogin: json['lastLogin'],
        memberSince: json['memberSince']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['shopType'] = shopType;
    data['lastLogin'] = lastLogin;
    data['memberSince'] = memberSince;
    return data;
  }
}
