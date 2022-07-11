import 'package:flutter/material.dart';

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

  InkWell buttonWidget(String text) {
    return InkWell(
      onTap: () {},
      child: Container(
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
      ),
    );
  }

  Widget inputFields(String src, String hint, bool suffixBtn,
      TextEditingController controller, bool obscureText) {
    return Container(
      width: double.infinity,
      height: 60,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Color(0xffeeedec),
          filled: true,
          prefixIcon: Container(
              height: 10,
              width: 10,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(src),
              )),
          suffix: suffixBtn
              ? TextButton(
                  onPressed: () {
                    print("forgot password clicked");
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
