import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerifySignup extends StatefulWidget {
  const VerifySignup({Key? key}) : super(key: key);

  @override
  State<VerifySignup> createState() => _VerifySignupState();
}

class _VerifySignupState extends State<VerifySignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                // first heading
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FarmerEats',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                //sign up page no. text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Signup 3 of 4',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //Verification text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Verification',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
