import 'dart:convert';

UserLoginResponse userLoginResponseFromJson(String str) => UserLoginResponse.fromJson(json.decode(str));

String userLoginResponseToJson(UserLoginResponse data) => json.encode(data.toJson());

class UserLoginResponse {
  final String name;
  final String lastName;
  final String email;
  final bool resultOk;

  UserLoginResponse({
    required this.resultOk,
    required this.name,
    required this.lastName,
    required this.email,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => UserLoginResponse(
        resultOk: json['resultOk'],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "resultOk": resultOk,
        "name": name,
        "lastName": lastName,
        "email": email,
      };
}
