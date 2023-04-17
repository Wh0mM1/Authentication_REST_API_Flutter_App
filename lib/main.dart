import 'package:flutter/material.dart';
import 'package:sign_up_with_node/auth/AuthPage.dart';
import 'package:sign_up_with_node/screens/LogInPage.dart';
import 'package:sign_up_with_node/screens/SignUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
