import 'package:flutter/foundation.dart';
import 'package:login_page_clean_architecture/features/login/domain/use_cases/login_usecase.dart';

enum LoadingState { loading, loaded }

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase useCase = LoginUseCase();
  LoadingState _state = LoadingState.loaded;
  String? userName;
  String? password;
  bool? isUserAvailable = false;

  LoadingState get state => _state;

  void changeLoadingState(LoadingState loadingState) {
    _state = loadingState;
  }

  login() async {
    if (kDebugMode) {
      print('login from view model called with $userName $password  ');
    }
    isUserAvailable = await useCase.login(userName: userName,password: password);
    notifyListeners();
    if (kDebugMode) {
      print('login from view model $isUserAvailable');
    }
  }
}
