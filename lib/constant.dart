import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  toggleableActiveColor: Colors.white,
  textTheme: const TextTheme().apply(
    displayColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.indigo[400],
    disabledColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[700],
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[700],
    selectedIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    unselectedIconTheme: const IconThemeData(
      color: Colors.white38,
    ),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.indigo[400],
  textTheme: const TextTheme().apply(
    displayColor: Colors.black,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.indigo[400],
    disabledColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo[400],
      iconTheme: const IconThemeData(
        color: Colors.white,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.indigo[400],
    selectedIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    unselectedIconTheme: const IconThemeData(
      color: Colors.white38,
    ),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
  ),
);

RxBool isLightTheme = false.obs;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', isLightTheme.value);
}

getThemeStatus() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  isLightTheme.value = (await _isLight.value)!;
  Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}
