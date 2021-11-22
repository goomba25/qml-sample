import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _TopBarState extends State<TopBar> {
  String? currentTime;

  void getTime() {
    setState(() {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF141719),
      padding: const EdgeInsets.fromLTRB(34, 10, 40, 10),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            height: 40,
            child: Text(
              currentTime.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Noto Sans",
                fontSize: 32,
                color: const Color(0xFFFFFFFF).withOpacity(0.6),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 34),
            child: Image.asset('images/TopBar/normal/LockOpen.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image.asset('images/TopBar/normal/warning.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image.asset('images/TopBar/normal/mail.png'),
          ),
          const Spacer(),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset('images/TopBar/normal/streaming.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Streaming",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Noto Sans",
                fontSize: 32,
                color: const Color(0xFFFFFFFF).withOpacity(0.6),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset('images/TopBar/normal/VolumeOff.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image.asset('images/TopBar/normal/BtDisable.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image.asset('images/TopBar/normal/WifiOff.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image.asset('images/TopBar/normal/LteDisable.png'),
          ),
        ],
      ),
    );
  }
}
