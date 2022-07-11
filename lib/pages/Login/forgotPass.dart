import 'package:flutter/material.dart';


class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  final _formKey = GlobalKey<FormState>();  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: Form(
        key: _formKey,
        child: Column(
          children: [
            
          ],
        ),
      ),),),
    );
  }
}
