import 'dart:async';

import 'package:ebook_flutter_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_data(context, 0);

    Timer(Duration(seconds: 5), () => Get.off(() => IntroScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
      ),
    );
  }
}
