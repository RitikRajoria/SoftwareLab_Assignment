import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/Login/verifyOTP_FP.dart';
import 'package:softwarelab_assignment/widgets/widgetsUi.dart';

import '../../data services/data_services.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _forgotPass() async {
    print("checking number....");

    String data = '{"mobile": "${phoneController.text}"}';

    var res = await CallApi().forgotPassAccount(data, 'user/forgot-password');
    var body = jsonDecode(res.body);
    if (body['success']) {
      //otp sent
      print("logged In");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("OTP sent to your mobile.")));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Verify_Otp(
                    phone: phoneController.text,
                  )));
    } else if (body['message'] == "Couldn't send an OTP, please try again.") {
      //success false state

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${body['message']}")));
    } else {
      //account with number not exists
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
                      'Forgot Password?',
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
                          Navigator.pop(context);
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

                  //phone no. field
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        //email
                        inputFields(
                            src: 'assets/Vector@3x-1.png',
                            hint: 'Phone Number',
                            suffixBtn: false,
                            controller: phoneController,
                            obscureText: false,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  //login button
                  InkWell(
                    onTap: () {
                      _forgotPass();
                    },
                    child: buttonWidget(
                      'Send Code',
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
