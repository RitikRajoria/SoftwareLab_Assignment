import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/Login/login.dart';

import '../../data services/data_services.dart';
import '../../widgets/widgetsUi.dart';

class ResetPass extends StatefulWidget {
  final String token;

  const ResetPass({super.key, required this.token});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _resetPass() async {
    print("checking number....");

    String data =
        '{"token": "${widget.token}","password": "${newPass.text}","cpassword": "${confirmPass.text}"}';

    var res = await CallApi().resetPassAccount(data, 'user/reset-password');
    var body = jsonDecode(res.body);
    if (body['success']) {
      //pass reset done

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Your password has been successfully changed.")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      //server error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${body['message']}")));
    }
  }

  @override
  Widget build(BuildContext context) {
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

                  //Forgot pass text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reset Password',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //login again text
                  Row(
                    children: [
                      Text(
                        'Remember your password?',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login',
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

                  //password fields
                  Container(
                    height: 200,
                    child: Column(
                      children: [
                        //new password
                        inputFields('assets/Group 47@3x.png', 'NewPassword',
                            false, newPass, false, context),

                        const SizedBox(
                          height: 28,
                        ),
                        //re-enter password
                        inputFields(
                            'assets/Group 47@3x.png',
                            'Confirm New Password',
                            false,
                            confirmPass,
                            false,
                            context),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  //submit button
                  InkWell(
                    onTap: () {
                      _resetPass();
                    },
                    child: buttonWidget(
                      'Submit',
                    ),
                  ),
                  const SizedBox(
                    height: 34,
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
