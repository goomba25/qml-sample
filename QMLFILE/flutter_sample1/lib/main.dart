import 'package:flutter/material.dart'; //  google
import 'package:flutter/services.dart';
import 'MenuBar/menubarapp.dart';
import 'TopBar/topbarapp.dart';
import 'Navigation/navigationapp.dart';
import 'Media/mediaapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      home: Scaffold(
        appBar: const TopBar(),
        body: Row(
          children: [
            NavigationApp(),
            const MediaMain(),
          ],
        ),
        bottomNavigationBar: const SizedBox(
          height: 100,
          child: MenuBar(),
        ),
      ),
    );
  }
}
