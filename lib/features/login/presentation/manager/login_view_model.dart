import 'package:flutter/foundation.dart';
import 'package:login_page_clean_architecture/features/login/domain/use_cases/login_usecase.dart';

enum LoadingState { loading, loaded }

///Login View model cannot access the login screen
class LoginViewModel extends ChangeNotifier {
  ///Login UseCase
  final LoginUseCase useCase = LoginUseCase();

  ///View related variables
  LoadingState _state = LoadingState.loaded;
  String? userName;
  String? password;
  bool? isUserAvailable = false;

  LoadingState get state => _state;

  void _changeLoadingState(LoadingState loadingState) {
    _state = loadingState;
    notifyListeners();
  }

  ///Login function for view
  ///Only view related changes here
  ///function calls the useCase method for business logic
  login() async {
    _changeLoadingState(LoadingState.loading);
    if (kDebugMode) {
      print('login from view model called with $userName $password  ');
    }
    isUserAvailable =
        await useCase.login(userName: userName, password: password);
    notifyListeners();
    _changeLoadingState(LoadingState.loaded);
    if (kDebugMode) {
      print('login from view model $isUserAvailable');
    }
  }
}
