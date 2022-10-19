import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_app/screens/authentication.dart';
import 'package:mini_app/utilites/theme_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getTheme(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: "assets/page1/spllogo.png",
        splashIconSize: 250,
        backgroundColor: const Color.fromRGBO(30, 136, 252, 1),
        nextScreen: const Authentication(),
      ),
    );
  }
}

