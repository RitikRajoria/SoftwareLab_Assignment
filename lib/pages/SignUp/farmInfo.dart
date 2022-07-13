import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:softwarelab_assignment/pages/SignUp/verify_signUp.dart';
import 'package:softwarelab_assignment/utils/state_name.dart';
import 'package:softwarelab_assignment/widgets/widgetsUi.dart';

import '../../widgets/helper.dart';

class FarmInfo extends StatefulWidget {
  final String email;
  final String password;
  final String phone;

  final String fullname;

  const FarmInfo(
      {super.key,
      required this.email,
      required this.password,
      required this.phone,
      required this.fullname});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController businessName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  _nextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifySignup(
              role: 'farmer',
              email: widget.email,
              password: widget.password,
              phone: widget.phone,
              fullname: widget.fullname,
              bName: businessName.text,
              nickName: nickName.text,
              address: streetAddress.text,
              city: city.text,
              state: dropdownValue!,
              zipcode: zipcode.text),
        ));
  }

  String? dropdownValue;

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
                    height: 50,
                  ),

                  //sign up page no. text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Signup 2 of 4',
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
                      'Farm Info',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //email & password field
                  Container(
                    height: 400,
                    child: Column(
                      children: [
                        //business name
                        inputFields(
                            src: 'assets/Group 59@3x.png',
                            hint: 'Business Name',
                            suffixBtn: false,
                            controller: businessName,
                            obscureText: false,
                            context: context,
                            validate: _nameValidate),
                        const SizedBox(
                          height: 25,
                        ),
                        //informal name
                        inputFields(
                            src: 'assets/Group 57@3x.png',
                            hint: 'Informal Name',
                            suffixBtn: false,
                            controller: nickName,
                            obscureText: false,
                            context: context,
                            validate: _nameValidate),
                        const SizedBox(
                          height: 25,
                        ),
                        //street address
                        inputFields(
                            src: 'assets/Vector@3x-3.png',
                            hint: 'Street Address',
                            suffixBtn: false,
                            controller: streetAddress,
                            obscureText: false,
                            context: context,
                            validate: _addressValidate),
                        const SizedBox(
                          height: 25,
                        ),
                        //city name
                        inputFields(
                            src: 'assets/Group 58@3x.png',
                            hint: 'City',
                            suffixBtn: false,
                            controller: city,
                            obscureText: false,
                            context: context,
                            validate: _cityValidate),
                        const SizedBox(
                          height: 25,
                        ),
                        //state and zipcode
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //dropdown state list
                            Container(
                              height: 60,
                              width: (size.width) * 0.395,
                              child: DropdownButtonFormField<String>(
                                style: TextStyle(
                                    fontSize: 14.5, color: Colors.black),
                                icon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset('assets/Polygon 1@3x.png'),
                                ),
                                decoration: InputDecoration(
                                  hintText: '  State',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffeeedec),
                                ),
                                value: dropdownValue,
                                items: states
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => dropdownValue = item!),
                              ),
                            ),

                            //zipcode
                            Container(
                              width: (size.width) * 0.42,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{5,}$');
                                  if (value!.isEmpty) {
                                    snackBar(context, "Enter zipcode");
                                    return null;
                                  }
                                  if (!regex.hasMatch(value)) {
                                    snackBar(context,
                                        "Enter Minimum 5 Character For Zipcode.");
                                    return null;
                                  }
                                  return null;
                                },
                                controller: zipcode,
                                onSaved: (value) {
                                  zipcode.text = value!;
                                },
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  fillColor: Color(0xffeeedec),
                                  filled: true,
                                  hintText: 'Enter Zipcode',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),

                  //continue button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 18,
                          width: 26,
                          child: Image.asset('assets/Vector@3x-4.png'),
                        ),
                      ),

                      //continue button
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (dropdownValue != "" &&
                                zipcode.text.isNotEmpty) {
                              _nextPage();
                            } else {
                              snackBar(context, "Select your state.");
                            }
                          }
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

  String? _nameValidate(String? value) {
    RegExp regex = new RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      snackBar(context, "Name cannot be empty");
      return null;
    }
    if (!regex.hasMatch(value)) {
      snackBar(context, "Enter Minimum 3 Character For Your Name.");
      return null;
    }
    return null;
  }

  String? _addressValidate(String? value) {
    RegExp regex = new RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      snackBar(context, "Address cannot be empty");
      return null;
    }
    if (!regex.hasMatch(value)) {
      snackBar(context, "Enter Minimum 3 Character For Address.");
      return null;
    }
    return null;
  }

  String? _cityValidate(String? value) {
    RegExp regex = new RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      snackBar(context, "City cannot be empty");
      return null;
    }
    if (!regex.hasMatch(value)) {
      snackBar(context, "Enter Minimum 3 Character For City Name.");
      return null;
    }
    return null;
  }
}
