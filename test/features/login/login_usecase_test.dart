import 'package:flutter_test/flutter_test.dart';
import 'package:login_page_clean_architecture/features/login/data/repositories/database_user_login.dart';
import 'package:login_page_clean_architecture/features/login/domain/use_cases/login_usecase.dart';

void main() {
  LoginUseCase? useCase;
  setUp((){
    useCase = LoginUseCase.test();
    useCase?.api = DatabaseUserLogin();
  });
  test('login', () async{
    final response1 = await useCase?.login(userName: 'admin',password: 'admin');
    expect(response1, true);
    final response2 = await useCase?.login(userName: 'cat',password: 'paw');
    expect(response2, false);
  });
}
