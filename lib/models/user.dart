class User {
  String weedingCode;
  String name;
  String token;

  User({this.weedingCode, this.name, this.token});

  factory User.fromJSON(json) => User(
      name: json['name'], token: json['token'], weedingCode: json['token']);

  Map<String, dynamic> toJSON() => {
        'name': this.name,
        'token': this.token,
        'weedingCode': this.weedingCode,
      };
}
