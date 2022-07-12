import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:softwarelab_assignment/utils/weekDays.dart';

import '../../utils/hours.dart';

class BusinessHoursPage extends StatefulWidget {
  final String email;
  final String password;
  final String phone;
  final String fullname;
  final String bName;
  final String nickName;
  final String address;
  final String city;
  final String state;
  final String zipcode;
  final String verification;

  const BusinessHoursPage(
      {super.key,
      required this.email,
      required this.password,
      required this.phone,
      required this.fullname,
      required this.bName,
      required this.nickName,
      required this.address,
      required this.city,
      required this.state,
      required this.zipcode,
      required this.verification});

  @override
  State<BusinessHoursPage> createState() => _BusinessHoursPageState();
}

class _BusinessHoursPageState extends State<BusinessHoursPage> {
  int selectedIndex = 0;

  final List<Map> weekData = List.generate(
      weekDays.length,
      (index) => {
            'id': index,
            'name': '${weekDays[index]}',
            'isSelected': false,
            'currentIndex': false
          });
  final List<Map> hoursData = List.generate(
      hours.length,
      (index) => {
            'id': index,
            'name': '${hours[index]}',
            'isSelected': false,
          });
          
 

  _register() {
    print('register');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    'Signup 4 of 4',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                //Verification text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Business Hours',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //paragraph
                Text(
                  'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),

                //week days tab
                Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 34),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weekData.length,
                      itemBuilder: (context, index) {
                        return weekTabs(weekData[index]['name'], index);
                      },
                    ),
                  ),
                ),

                //timeline grid

                Container(
                  height: 280,
                  child: GridView.builder(
                    itemCount: hours.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 2.7 / 1),
                    itemBuilder: (context, index) {
                      return hoursTab(size, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget hoursTab(Size size, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          hoursData[index]['isSelected'] = !hoursData[index]['isSelected'];
        });
      },
      child: Container(
        height: 48,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: hoursData[index]['isSelected'] == true
              ? Color(0xffF8C569)
              : Colors.grey.shade300,
        ),
        child: Center(child: Text('${hoursData[index]['name']}')),
      ),
    );
  }

  Widget weekTabs(String weekName, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          weekData[index]['isSelected'] = !weekData[index]['isSelected'];

          for (int i = 0; i < 7; i++) {
            if (index == i) {
              weekData[i]['currentIndex'] = true;
              //weekData[i]['isSelected'] = true;
              // print(weekData[i]['isSelected']);
            } else {
              weekData[i]['currentIndex'] = false;
              print(weekData[i]['isSelected']);
            }
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
        ),
        child: Container(
          height: 41,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: weekData[index]['currentIndex']
                ? Color(0xffd5715b)
                : weekData[index]['isSelected'] == true
                    ? Colors.grey.shade300
                    : Colors.white,
            border: Border.all(
                width: 1,
                color: weekData[index]['isSelected'] == false
                    ? Colors.grey.shade400
                    : Colors.transparent),
          ),
          child: Center(
            child: Text(
              weekName,
              style: TextStyle(
                color: weekData[index]['currentIndex']
                    ? Colors.white
                    : weekData[index]['isSelected']
                        ? Colors.black
                        : Colors.grey.shade400,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
