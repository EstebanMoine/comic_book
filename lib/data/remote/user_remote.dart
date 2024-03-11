import 'dart:developer';

import 'package:comic_book/models/remote/login/user_login_response_model.dart';

class UserRemote {
  static Future<UserLoginResponse?> getApiResponse(String email, String password) async {
    try {
      //FAKE LOGIN
      //login to apirest
      await Future.delayed(const Duration(seconds: 2));
      log('emai $email and password $password login OK');

      var jsonResponse = {
        'resultOk': true,
        'name': 'Esteban',
        'lastName': 'Moine',
        'email': 'estebanmoine9@gmail.com',
      };

      return UserLoginResponse.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }
}
