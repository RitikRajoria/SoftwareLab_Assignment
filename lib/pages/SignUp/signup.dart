import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:softwarelab_assignment/data%20services/data_services.dart';
import 'package:softwarelab_assignment/pages/SignUp/farmInfo.dart';

import '../../widgets/widgetsUi.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _rePass = TextEditingController();

  _nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FarmInfo(
            email: _email.text,
            password: _pass.text,
            phone: _phoneNumber.text,
            fullname: _fullName.text),
      ),
    );
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
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
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
                    height: 35,
                  ),

                  //sign up page no. text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Signup 1 of 4',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //welcome text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome!',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //icon buttons only ui
                  iconButtons(),
                  const SizedBox(
                    height: 20,
                  ),

                  //Text
                  Text(
                    'or signup with',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //email & password field
                  Container(
                    height: 400,
                    child: Column(
                      children: [
                        //full name
                        inputFields('assets/Group 54@3x.png', 'Full Name',
                            false, _fullName, false,context),
                        const SizedBox(
                          height: 25,
                        ),
                        //email
                        inputFields('assets/Vector@3x-2.png', 'Email Address',
                            false, _email, false,context),
                        const SizedBox(
                          height: 25,
                        ),
                        //phone number
                        inputFields('assets/Vector@3x-1.png', 'Phone Number',
                            false, _phoneNumber, false,context),
                        const SizedBox(
                          height: 25,
                        ),
                        //password field
                        inputFields('assets/Group 47@3x.png', 'Enter Password',
                            false, _pass, true,context),
                        const SizedBox(
                          height: 25,
                        ),
                        inputFields('assets/Group 47@3x.png',
                            'Re-enter Password', false, _rePass, true,context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  //sign up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //login button
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: buttonWidgetUnderlined('Login'),
                      ),

                      //continue button
                      InkWell(
                        onTap: () {
                          _nextPage();
                        },
                        child: Container(
                          width: (size.width) * 0.58,
                          child: buttonWidget(
                            'Continue',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
