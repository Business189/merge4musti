// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyVideoTab extends StatelessWidget {
  MyVideoTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("tab1");
    return Container(
      child: Text("My Video"),
    );
  }
}
