import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/SignUp/signup.dart';
import 'package:softwarelab_assignment/widgets/helper.dart';

import '../../data services/data_services.dart';
import '../../widgets/widgetsUi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _login() async {
    print("Logging....");

    String data =
        '{"email": "${emailController.text}","password": "${passwordController.text}","role": "farmer","device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx","type": "email","social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"}';

    var res = await CallApi().loginAccount(data, 'user/login');
    var body = jsonDecode(res.body);
    if (body['success']) {
      //navigate to other page
      print("logged In");
      snackBar(context, "Log In Successful!");
    } else if (body['message'] == "Account does not exist.") {
      //email exists
      print("email not exists");
      snackBar(context, body['message']);
    } else if (body['message'] ==
        "Account is not verified, please contact administrator.") {
      //navigate to other page
      print(body['message']);
      snackBar(context, body['message']);
    } else {
      print(body['message']);
      snackBar(context, body['message']);
    }
  }

  String? _emailValidate(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      snackBar(context, "Please enter email.");
      return null;
    }
    //reg expression
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      snackBar(context, "Please enter a valid email.");
      return null;
    }
  }

  String? _passwordValidate(String? value) {
    RegExp regex = new RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      snackBar(context, "Password is required for login");
      return null;
    }
    if (!regex.hasMatch(value)) {
      snackBar(context, "Enter Valid Password(Min. 6 Character)");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  // first heading
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'FarmerEats',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                  //welcome back text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome back!',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //sign up text
                  Row(
                    children: [
                      Text(
                        'New Here?',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            color: Color(0xffd5715b),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //email & password field
                  Container(
                    height: 180,
                    child: Column(
                      children: [
                        //email
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffeeedec),
                                borderRadius: BorderRadius.circular(12)),
                            child: inputFields(
                                src: 'assets/Vector@3x-2.png',
                                hint: 'Email Address',
                                suffixBtn: false,
                                controller: emailController,
                                obscureText: false,
                                context: context,
                                validate: _emailValidate),
                          ),
                        ),

                        const SizedBox(
                          height: 28,
                        ),
                        //password field
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffeeedec),
                                borderRadius: BorderRadius.circular(12)),
                            child: inputFields(
                                src: 'assets/Group 47@3x.png',
                                hint: 'Password',
                                suffixBtn: true,
                                controller: passwordController,
                                obscureText: true,
                                context: context,
                                validate: _passwordValidate),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //login button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                        print("trying log in");
                      }
                    },
                    child: buttonWidget(
                      'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    'or login with',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //icon buttons only ui
                  iconButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
