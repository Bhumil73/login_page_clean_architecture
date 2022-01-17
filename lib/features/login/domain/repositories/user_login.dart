import 'package:login_page_clean_architecture/common/enum.dart';

abstract class UserLogin {
  BackendResponse userLogin(
      {required String? userName, required String? password});
}
