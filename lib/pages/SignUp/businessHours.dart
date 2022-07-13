import 'package:flutter/material.dart';
import 'package:softwarelab_assignment/pages/SignUp/widgets/hours_widget.dart';

import 'package:softwarelab_assignment/utils/weekDays.dart';

import '../../models/days_model.dart';
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

  final List<Hours> hoursData = List.generate(hours.length, (index) {
    return Hours(isSelected: false, name: hours[index]);
  });

  final List<Days> weekData = List.generate(weekDays.length, (index) {
    return Days(
        selectedHours: [],
        isSelected: false,
        name: weekDays[index],
        currentIndex: false);
  });

  _register() {
    print('register');
  }

  var currentSelectedDay = Days(
      selectedHours: [],
      isSelected: false,
      name: weekDays[0],
      currentIndex: true);

  int hoursViewIndex = 0;

  List<Widget> hoursView = [];

  @override
  void initState() {
    final List<Hours> _hoursData = List.generate(hours.length, (index) {
      return Hours(isSelected: false, name: hours[index]);
    });

    hoursView = [
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 0,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 1,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 2,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 3,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 4,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 5,
      ),
      HoursWidget(
        hoursData: _hoursData,
        selectedIndex: 6,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //print(currentSelectedDay.selectedHours);

    // for (var hour in hoursData) {
    //   currentSelectedDay.selectedHours.forEach((element) {
    //     hour.isSelected = element.name == hour.name ? true : false;
    //   });
    // }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                // first heading
                const Align(
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
                const Align(
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
                  padding: const EdgeInsets.only(top: 25, bottom: 34),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weekData.length,
                    itemBuilder: (context, index) {
                      return weekTabs(weekData[index].name, index);
                    },
                  ),
                ),

                //timeline grid

                SizedBox(
                  height: 280,
                  child: hoursView[selectedIndex],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget weekTabs(String weekName, int index) {
    return InkWell(
      onTap: () {
        weekData[index].isSelected = !weekData[index].isSelected;

        selectedIndex = index;
        print("selected index inside main page $index");
        if (currentSelectedDay.name == weekData[index].name) {
          weekData[index]
              .selectedHours
              .addAll(currentSelectedDay.selectedHours);
        }

        //show selected hours from selected day
        for (var selectedhour in weekData[index].selectedHours) {
          for (var element in hoursData) {
            element.isSelected =
                selectedhour.name == element.name ? true : false;
          }
        }

        for (int i = 0; i < 7; i++) {
          if (index == i) {
            weekData[i].currentIndex = true;
            currentSelectedDay = weekData[i];
          } else {
            weekData[i].currentIndex = false;
            //print(weekData[i].isSelected);
          }
        }
        setState(() {});
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
            color: weekData[index].currentIndex
                ? const Color(0xffd5715b)
                : weekData[index].isSelected == true
                    ? Colors.grey.shade300
                    : Colors.white,
            border: Border.all(
                width: 1,
                color: weekData[index].isSelected == false
                    ? Colors.grey.shade400
                    : Colors.transparent),
          ),
          child: Center(
            child: Text(
              weekName,
              style: TextStyle(
                color: weekData[index].currentIndex
                    ? Colors.white
                    : weekData[index].isSelected
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
