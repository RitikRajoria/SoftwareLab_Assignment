import 'package:flutter/material.dart';


class Verify_FP extends StatefulWidget {
  const Verify_FP({Key? key}) : super(key: key);

  @override
  State<Verify_FP> createState() => _Verify_FPState();
}

class _Verify_FPState extends State<Verify_FP> {

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
