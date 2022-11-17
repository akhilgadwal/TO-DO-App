import 'package:flutter/material.dart';
import 'package:to_do/pages/Homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  //BoxOpening
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: AnimatedSplashScreen(
          duration: 1500,
          splash: Icon(
            Icons.notes,
            color: Colors.brown.shade300,
            size: 100,
          ),
          splashIconSize: 100,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
    );
  }
}
