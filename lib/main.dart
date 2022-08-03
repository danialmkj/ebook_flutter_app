import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/screens/home_screen.dart';
import 'package:ebook_flutter_app/screens/my_app.dart';
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
      home:  MyAppComplete(),
    );
  }
}
