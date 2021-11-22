import 'package:flutter/material.dart'; //  google
import 'package:flutter/cupertino.dart'; //  apple

var backgroundColor = const Color(0xFFF6A00C).withOpacity(0.6);

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 517,
      child: Container(
        color: backgroundColor,
        child: const Center(
          child: Text(
            " 나?\n\n네비.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
              fontFamily: "Noto Sans",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
