import 'package:flutter/material.dart';
import 'package:new_project/loginscreen.dart';
import 'package:new_project/main.dart';



class MobilescreenLayout extends StatefulWidget {
  const MobilescreenLayout({super.key});

  @override
  State<MobilescreenLayout> createState() => _MobilescreenLayoutState();
}

class _MobilescreenLayoutState extends State<MobilescreenLayout> {
  @override
  Widget build(BuildContext context) {
    return loginscreen();
  }
}
