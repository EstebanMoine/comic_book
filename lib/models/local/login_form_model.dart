class LoginFormModel {
  String email;
  String password;
  bool showPassword;

  LoginFormModel({
    required this.email,
    required this.password,
    required this.showPassword,
  });

  LoginFormModel copyWith({String? email, String? password, bool? showPassword}) {
    return LoginFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
