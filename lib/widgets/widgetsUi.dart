import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/Login/forgotPass.dart';

Row iconButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        height: 52,
        width: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(55),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/icons8-google 1@3x.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      Container(
        height: 52,
        width: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(55),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/icons8-apple-logo 1@3x.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      Container(
        height: 52,
        width: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(55),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/Group 52@3x.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    ],
  );
}

Widget buttonWidget(String text) {
  return Container(
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(65),
      color: Color(0xffd5715b),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget buttonWidgetUnderlined(String text) {
  return Container(
    height: 55,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}

Widget inputFields(
    {required String src,
    required String hint,
    required bool suffixBtn,
    required TextEditingController controller,
    required bool obscureText,
    required BuildContext context,
    String? Function(String?)? validate,
    TextInputType? keyType}) {
  return Container(
    width: double.infinity,
    height: 60,
    child: TextFormField(
      validator: validate,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Color(0xffeeedec),
        filled: true,
        prefixIcon: Container(
            height: 15,
            width: 15,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(src),
            )),
        suffix: suffixBtn
            ? TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPass()));
                },
                child: Text(
                  'Forgot ?',
                  style: TextStyle(
                    color: Color(0xffd5715b),
                  ),
                ),
              )
            : Container(
                height: 1,
                width: 1,
              ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
