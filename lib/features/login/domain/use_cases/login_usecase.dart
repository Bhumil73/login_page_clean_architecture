import 'package:flutter/foundation.dart';
import 'package:login_page_clean_architecture/common/enum.dart';
import 'package:login_page_clean_architecture/features/login/data/repositories/database_user_login.dart';
import 'package:login_page_clean_architecture/features/login/domain/repositories/user_login.dart';
import 'package:login_page_clean_architecture/locator.dart';

///Login useCase cannot access the login view model or the UI
///business logic is completely independent of UI
class LoginUseCase {
  ///API injection
  UserLogin api = locator<DatabaseUserLogin>();

  ///Function to fetch login response from backend services like API, Firebase etc
  ///business logic is here
  Future<bool?> login({String? userName, String? password}) async {
    if (kDebugMode) {
      print('use case $userName $password');
    }
    final loginResponse = api.userLogin(userName: userName, password: password);
    if (kDebugMode) {
      print('use case response $loginResponse');
    }
    if (loginResponse == BackendResponse.success) {
      return true;
    } else {
      return false;
    }
  }
}
