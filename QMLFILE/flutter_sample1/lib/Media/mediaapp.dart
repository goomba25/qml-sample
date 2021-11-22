import 'package:flutter/material.dart';
import 'package:flutter_sample1/custombutton.dart';
import 'musicplayer.dart';

class MediaMain extends StatefulWidget {
  const MediaMain({Key? key}) : super(key: key);

  @override
  _MediaMainState createState() => _MediaMainState();
}

class _MediaMainState extends State<MediaMain> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 83, top: 8, right: 584),
            color: const Color(0xFF353739),
            height: 143,
          ),
          const MusicPlayer(),
        ],
      ),
    );
  }
}
