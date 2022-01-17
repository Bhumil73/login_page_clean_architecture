import 'package:get_it/get_it.dart';
import 'package:login_page_clean_architecture/features/login/data/repositories/database_user_login.dart';
import 'package:login_page_clean_architecture/features/login/presentation/manager/login_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => DatabaseUserLogin());
  locator.registerFactory(() => LoginViewModel());
}
