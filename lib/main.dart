import 'package:flutter/material.dart';
import 'package:login_page_clean_architecture/features/login/presentation/pages/login.dart';
import 'package:login_page_clean_architecture/locator.dart';

void main() {
  //Setting up get it for injection
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
