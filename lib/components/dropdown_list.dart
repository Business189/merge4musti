// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:four_musti/utils/themes.dart';

Widget dropDownList(BuildContext context, String label, String initialItem,
    List<String> items) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4))),
    padding: EdgeInsets.only(left: 12, top: 6),
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: lightVioletI),
        ),
        Positioned(
          top: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 69,
            child: DropdownButton(
              onChanged: (value) {
                //  setState(() {});
              },
              value: initialItem,
              items: items.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryColorII),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
