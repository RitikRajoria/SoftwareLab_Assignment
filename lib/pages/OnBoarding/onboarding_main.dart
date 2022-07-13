import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:softwarelab_assignment/pages/OnBoarding/onBoarding1.dart';
import 'package:softwarelab_assignment/pages/OnBoarding/onBoarding2.dart';
import 'package:softwarelab_assignment/pages/OnBoarding/onBoarding3.dart';

class onBoardingMain extends StatefulWidget {
  const onBoardingMain({Key? key}) : super(key: key);

  @override
  State<onBoardingMain> createState() => _onBoardingMainState();
}

class _onBoardingMainState extends State<onBoardingMain> {
  List<Widget> pages = [
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView.builder(itemCount:pages.length,itemBuilder: ),
      ),
    );
  }
}
