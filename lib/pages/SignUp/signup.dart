import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/widgetsUi.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController rePass = TextEditingController();

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
                            false, fullName, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //email
                        inputFields('assets/Vector@3x-2.png', 'Email Address',
                            false, email, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //phone number
                        inputFields('assets/Vector@3x-1.png', 'Email Address',
                            false, phoneNumber, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //password field
                        inputFields('assets/Group 47@3x.png', 'Enter Password',
                            true, pass, true),
                        const SizedBox(
                          height: 25,
                        ),
                        inputFields('assets/Group 47@3x.png',
                            'Re-enter Password', true, rePass, true),
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
                        onTap: () {},
                        child: buttonWidgetUnderlined('Login'),
                      ),

                      //continue button
                      InkWell(
                        onTap: () {},
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
