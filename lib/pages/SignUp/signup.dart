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

  // _register() async {
  //   String socialId = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
  //   var data = {
//   "full_name": "john doe",
//   "email": "johndoe@mail.com",
//   "phone": "+19876543210",
//   "password": "12345678",
//   "role": "farmer",
//   "business_name": "Dairy Farm",
//   "informal_name": "London Dairy",
//   "address": "3663 Marshville Road",
//   "city": "Poughkeepsie",
//   "state": "New York",
//   "zip_code": 12601,
//   "registration_proof": "my_proof.pdf",
//   "business_hours": {
//     "mon": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm"
//     ],
//     "tue": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm"
//     ],
//     "wed": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm",
//       "1:00pm - 4:00pm"
//     ],
//     "thu": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm",
//       "1:00pm - 4:00pm"
//     ],
//     "fri": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm"
//     ],
//     "sat": [
//       "8:00am - 10:00am",
//       "10:00am - 1:00pm"
//     ],
//     "sun": [
//       "8:00am -10:00am"
//     ]
//   },
//   "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
//   "type": "email/facebook/google/apple",
//   "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
// };

  //   var res = await RegisterCallApi().registerAccount(data, 'user/register');
  //   var body = jsonDecode(res.body);
  //   if (body['success']) {
  //     //navigate to other page
  //   } else if (body['message'] == "Email already exists.") {
  //     //email exists
  //     print("emailexists");
  //   } else {
  //     //navigate to other page
  //     print(body['message']);
  //     print("continue");
  //   }
  // }

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
                            false, _fullName, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //email
                        inputFields('assets/Vector@3x-2.png', 'Email Address',
                            false, _email, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //phone number
                        inputFields('assets/Vector@3x-1.png', 'Phone Number',
                            false, _phoneNumber, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //password field
                        inputFields('assets/Group 47@3x.png', 'Enter Password',
                            false, _pass, true),
                        const SizedBox(
                          height: 25,
                        ),
                        inputFields('assets/Group 47@3x.png',
                            'Re-enter Password', false, _rePass, true),
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
