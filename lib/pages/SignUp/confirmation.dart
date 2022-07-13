import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/Login/login.dart';
import 'package:softwarelab_assignment/widgets/widgetsUi.dart';

class ConfirmationSignUp extends StatefulWidget {
  const ConfirmationSignUp({Key? key}) : super(key: key);

  @override
  State<ConfirmationSignUp> createState() => _ConfirmationSignUpState();
}

class _ConfirmationSignUpState extends State<ConfirmationSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 184,
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    child: Image.asset(
                      'assets/Vector@3x.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    'You\'re all done!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.grey.shade400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 184,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: buttonWidget('Got it!'),
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
