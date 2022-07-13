import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:softwarelab_assignment/pages/Login/login.dart';
import 'package:softwarelab_assignment/pages/Login/resetPass.dart';

import '../../data services/data_services.dart';
import '../../widgets/widgetsUi.dart';

class Verify_Otp extends StatefulWidget {
  final String phone;

  const Verify_Otp({super.key, required this.phone});

  @override
  State<Verify_Otp> createState() => _Verify_OtpState();
}

class _Verify_OtpState extends State<Verify_Otp> {
  TextEditingController verifyController1 = TextEditingController();
  TextEditingController verifyController2 = TextEditingController();
  TextEditingController verifyController3 = TextEditingController();
  TextEditingController verifyController4 = TextEditingController();
  TextEditingController verifyController5 = TextEditingController();
  TextEditingController verifyController6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _verifyOTP() async {
    final userOtp = int.parse(
        "${verifyController1.text}${verifyController2.text}${verifyController3.text}${verifyController4.text}${verifyController5.text}${verifyController6.text}");
    print(userOtp);

    print("checking number....");

    String data = '{"otp": "$userOtp"}';

    Response res =
        await CallApi().verifyotpAccount(data, 'user/forgot-password');
    var body = jsonDecode(res.body);
    if (body['success']) {
      //success true
      print("logged In");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("OTP verified successful.")));

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResetPass(
                    token: body['token'],
                  )));
    } else if (res.statusCode == 401) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${body['message']}")));
    } else {
      //success false state
      //server error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${body['message']}")));
    }
  }

  _resendOTP() async {
    print("checking number....");

    String data = '{"mobile": "${widget.phone}"}';

    var res = await CallApi().forgotPassAccount(data, 'user/forgot-password');
    var body = jsonDecode(res.body);
    if (body['success']) {
      //otp sent

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("OTP resent to your mobile.")));
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
                            verifyOTP_input(context, verifyController1),
                            verifyOTP_input(context, verifyController2),
                            verifyOTP_input(context, verifyController3),
                            verifyOTP_input(context, verifyController4),
                            verifyOTP_input(context, verifyController5),
                            verifyOTP_input(context, verifyController6),
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
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ResetPass()));
                      _verifyOTP();
                    },
                    child: buttonWidget(
                      'Submit',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      _resendOTP();
                    },
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

  SizedBox verifyOTP_input(
      BuildContext context, TextEditingController controller) {
    return SizedBox(
      height: 49,
      width: 48,
      child: TextFormField(
        controller: controller,
        onSaved: (pin) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          print(value);
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
