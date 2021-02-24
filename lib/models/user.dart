class User {
  String weddingCode;
  String name;
  String token;

  User({this.weddingCode, this.name = '', this.token = ''});

  factory User.fromJSON(json) => User(
        name: json['name'],
        token: json['token'],
        weddingCode: json['weddingCode'],
      );

  Map<String, dynamic> toJSON() => {
        'name': this.name,
        'token': this.token,
        'weddingCode': this.weddingCode,
      };
}
