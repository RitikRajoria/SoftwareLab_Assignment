import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_file/open_file.dart';

import '../../widgets/widgetsUi.dart';

class VerifySignup extends StatefulWidget {
  const VerifySignup({Key? key}) : super(key: key);

  @override
  State<VerifySignup> createState() => _VerifySignupState();
}

class _VerifySignupState extends State<VerifySignup> {
  String fileName = "";
  TextEditingController filename = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    // first heading
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'FarmerEats',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
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
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade400),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Verification text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verification',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //paragraph
                    Text(
                      'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 65,
                    ),

                    //document picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Attach proof of registration'),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: InkWell(
                            onTap: () async {
                              final result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );
                              if (result == null) return;

                              //open single file
                              final file = result.files.first;
                              if (result != null) {
                                PlatformFile file = result.files.first;

                                print(file.name);
                                print(file.bytes);
                                print(file.size);
                                print(file.extension);
                                print(file.path);

                                setState(() {
                                  fileName = file.name;
                                  filename.text = fileName;
                                });
                              } else {
                                // User canceled the picker
                                return;
                              }
                            },
                            child: Container(
                              height: 53,
                              width: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffd5715b),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset('assets/Group 61@3x.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // document name field
                    Container(
                      height: (size.height) * 0.43,
                      child: Container(
                        width: (size.width),
                        height: 60,
                        child: fileName.isNotEmpty
                            ? TextFormField(
                                // enabled: false,
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: filename,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xffd5715b),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xffd5715b),
                                    ),
                                  ),
                                  fillColor: Color(0xffeeedec),
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        fileName = "";
                                        filename.text = "";
                                      });
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Container(
                    width: (size.width) * 0.771,
                    child: Row(
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
