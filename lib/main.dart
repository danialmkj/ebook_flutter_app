import 'package:ebook_flutter_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'screens/home_screen.dart';
import 'widgets/rounded_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Book App',
      theme: ThemeData(
          scaffoldBackgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          textTheme: Theme.of(context).textTheme.apply(displayColor: Get.isDarkMode ? Colors.white : Colors.black),
          appBarTheme: AppBarTheme(
              backgroundColor: Get.isDarkMode ? Colors.grey[700] : Colors.blue,
              iconTheme: IconThemeData(
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ))),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.grey[700]),
      home: DetailsScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline2,
                children: [
                  TextSpan(
                    text: "flamin",
                  ),
                  TextSpan(
                    text: "go.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                fontSize: 20,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
