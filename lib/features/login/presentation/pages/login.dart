import 'package:flutter/material.dart';
import 'package:login_page_clean_architecture/features/login/presentation/manager/login_view_model.dart';
import 'package:login_page_clean_architecture/locator.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text('Enter Info'),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('User Name'),
                  ),
                  onChanged: (String? value) {
                    model.userName = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  onChanged: (String? value) {
                    model.password = value;
                  },
                ),
                TextButton(
                    onPressed: () async {
                      await model.login();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(model.isUserAvailable!
                              ? 'user login success'
                              : 'user login failed'),
                        ),
                      );
                    },
                    child: const Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
