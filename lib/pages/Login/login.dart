import 'package:flutter/material.dart';

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
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
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
                        onPressed: () {},
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
                        inputFields('assets/Vector@3x-2.png', 'Email Address',
                            false, emailController, false),
                        const SizedBox(
                          height: 28,
                        ),
                        //password field
                        inputFields('assets/Group 47@3x.png', 'Password', true,
                            passwordController, true),
                      ],
                    ),
                  ),
                  //login button
                  InkWell(
                    onTap: () {},
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
