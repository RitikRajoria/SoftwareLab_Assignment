import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softwarelab_assignment/pages/Login/login.dart';
import 'package:softwarelab_assignment/pages/Login/resetPass.dart';

import '../../widgets/widgetsUi.dart';

class Verify_FP extends StatefulWidget {
  const Verify_FP({Key? key}) : super(key: key);

  @override
  State<Verify_FP> createState() => _Verify_FPState();
}

class _Verify_FPState extends State<Verify_FP> {
  TextEditingController verifyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

                  //verify OTP text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verify OTP',
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

                  //verify Otp fields
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            verifyOTP_input(context),
                            verifyOTP_input(context),
                            verifyOTP_input(context),
                            verifyOTP_input(context),
                            verifyOTP_input(context),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  //submit button
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResetPass()));
                    },
                    child: buttonWidget(
                      'Submit',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox verifyOTP_input(BuildContext context) {
    return SizedBox(
      height: 59,
      width: 58,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffeeedec),
          hintText: '0',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
