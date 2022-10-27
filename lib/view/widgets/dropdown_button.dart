import 'package:flutter/material.dart';
import 'package:hacker_news/view/constants/styles/colors.dart';

class AppBarDropDownButton extends StatefulWidget {
  const AppBarDropDownButton({super.key});

  @override
  State<AppBarDropDownButton> createState() => _AppBarDropDownButtonState();
}

class _AppBarDropDownButtonState extends State<AppBarDropDownButton> {
  var filterList = ['Popular', 'Date'];
  var currentValue = 'Popular';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: kOrange,
        iconEnabledColor: kWhite,
        items: filterList.map((String dropDownItem) {
          return DropdownMenuItem<String>(
            value: dropDownItem,
            child: Text(
              dropDownItem,
              style: const TextStyle(color: kWhite, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            currentValue = newValue!;
          });
        },
        value: currentValue,
      ),
    );
  }
}
