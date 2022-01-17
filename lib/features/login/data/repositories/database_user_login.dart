import 'package:login_page_clean_architecture/common/enum.dart';
import 'package:login_page_clean_architecture/features/login/domain/repositories/user_login.dart';

class DatabaseUserLogin implements UserLogin {
  @override
  BackendResponse userLogin(
      {required String? userName, required String? password}) {
    //API or Database call
    if (userName == 'admin' && password == 'admin') {
      return BackendResponse.success;
    } else {
      return BackendResponse.failure;
    }
  }
}
