import 'package:login_page_clean_architecture/common/enum.dart';

///Abstract class which defines the login related functions
abstract class UserLogin {
  BackendResponse userLogin(
      {required String? userName, required String? password});
}
