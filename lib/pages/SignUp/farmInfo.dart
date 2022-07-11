import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:softwarelab_assignment/utils/state_name.dart';
import 'package:softwarelab_assignment/widgets/widgetsUi.dart';

class FarmInfo extends StatefulWidget {
  const FarmInfo({Key? key}) : super(key: key);

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
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
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
                        inputFields('assets/Group 59@3x.png', 'Business Name',
                            false, businessName, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //informal name
                        inputFields('assets/Group 57@3x.png', 'Informal Name',
                            false, nickName, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //street address
                        inputFields('assets/Vector@3x-3.png', 'Street Address',
                            false, streetAddress, false),
                        const SizedBox(
                          height: 25,
                        ),
                        //city name
                        inputFields('assets/Group 58@3x.png', 'City', false,
                            city, true),
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
                                controller: zipcode,
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
                        onTap: () {},
                        child: Container(
                          height: 18,
                          width: 26,
                          child: Image.asset('assets/Vector@3x-4.png'),
                        ),
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
