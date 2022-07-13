import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/Login/forgotPass.dart';
import 'package:softwarelab_assignment/pages/Login/login.dart';
import 'package:softwarelab_assignment/pages/Login/verifyOTP_FP.dart';
import 'package:softwarelab_assignment/pages/SignUp/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 2,
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffd5715b),
            ),
          ),
        ),
      ),
      home: SignUpPage(),
    );
  }
}
