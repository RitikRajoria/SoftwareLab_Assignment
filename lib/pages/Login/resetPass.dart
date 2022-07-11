import 'package:flutter/material.dart';


class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {

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
