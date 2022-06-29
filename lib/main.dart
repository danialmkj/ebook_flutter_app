import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp() {
    getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Book App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      //ThemeData(
      // primaryColor: Get.isDarkMode ? Colors.white38 : Colors.indigo[400],
      // scaffoldBackgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      // textTheme: Theme.of(context).textTheme.apply(
      //     displayColor: Get.isDarkMode ? Colors.white : Colors.black),
      // appBarTheme: AppBarTheme(
      //     backgroundColor: Get.isDarkMode ? Colors.grey[700] : Colors.indigo[400],
      //     iconTheme: IconThemeData(
      //       color: Get.isDarkMode ? Colors.grey[700] : Colors.white,
      //     )),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: Get.isDarkMode ? Colors.grey[700] : Colors.indigo[400],
      //   selectedIconTheme: const IconThemeData(color: Colors.white,),
      //   unselectedIconTheme: const IconThemeData(color: Colors.white38,),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white38,
      //)),
      //darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.grey[700]),
    );
  }
}
