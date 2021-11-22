import 'package:flutter/material.dart'; //  google
import 'package:flutter/cupertino.dart'; //  apple
import 'package:flutter_sample1/custombutton.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF353739),
      padding: const EdgeInsets.fromLTRB(55, 10, 55, 10),
    );
  }
}
