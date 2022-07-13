import 'package:flutter/material.dart';

import '../../../models/days_model.dart';
import '../../../utils/hours.dart';

class HoursWidget extends StatefulWidget {
  final List<Hours> hoursData;
  final int selectedIndex;

  const HoursWidget(
      {super.key, required this.hoursData, required this.selectedIndex});

  @override
  State<HoursWidget> createState() => _HoursWidgetState();
}

class _HoursWidgetState extends State<HoursWidget> {
  @override
  Widget build(BuildContext context) {
    print("selectedIndex ${widget.selectedIndex}");
    return hoursWidget();
  }

  Widget hoursTab(
    int index,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.hoursData[index].isSelected =
              !widget.hoursData[index].isSelected;
          // add/remove hours from selectedDay
          if (widget.hoursData[index].isSelected) {
            //currentSelectedDay.selectedHours.add(hoursData[index]);
          } else {
            //currentSelectedDay.selectedHours.remove(hoursData[index]);
          }
        });
      },
      child: Container(
        height: 48,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.hoursData[index].isSelected == true
              ? const Color(0xffF8C569)
              : Colors.grey.shade300,
        ),
        child: Center(child: Text("${widget.hoursData[index].name}")),
      ),
    );
  }

  Widget hoursWidget() {
    return GridView.builder(
      itemCount: widget.hoursData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2.7 / 1),
      itemBuilder: (context, index) {
        return hoursTab(
          index,
        );
      },
    );
  }
}
