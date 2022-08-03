import 'dart:convert';
import 'package:ebook_flutter_app/model/image.dart';
import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:ebook_flutter_app/screens/about_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/text_value_list.dart';

//? Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.indigo[400],
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
//! Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  toggleableActiveColor: Colors.white,
  //fontFamily: ,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.indigo[400],
    disabledColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[700],
      iconTheme: const IconThemeData(
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

String nameAppBarChapter(int index) {
  switch (index) {
    case 0:
      return 'حداقل نیاز های برنامه';

    case 1:
      return 'برنامه آموزشی';

    case 2:
      return 'ارزشیابی';

    default:
      return 'مشخصات دوره';
  }
}

List<TextValue> parseJosn(String response) {
  if (response.isEmpty) {
    return [];
  }
  final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
  return parsed.map<TextValue>((json) => TextValue.fromJson(json)).toList();
}

List<MyImage> parseImage(response) {
  if (response.isEmpty) {
    return [];
  }
  final parsed = json.decode(response.toString());
  return parsed.map<MyImage>((json) => MyImage.fromJson(json)).toList();
}

FutureBuilder<String> fetch_data(BuildContext context, int index) {
  return FutureBuilder(
    future:
        DefaultAssetBundle.of(context).loadString('assets/db/text_value.json'),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Text('Press button to start.');
        case ConnectionState.active:
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());
        case ConnectionState.done:
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<TextValue> text_values = parseJosn(snapshot.data.toString());

            return text_values.isNotEmpty
                ? TextValueList(listTextValue: text_values, index: index)
                : Text("file is empty");
          }
      }
    },
  );
}

double? getFontSize(int? index) {
  switch (index) {
    case 0:
      return 14;
    case 1:
      return 17;
    default:
      return 20;
  }
}

String? getFontType(int? index) {
  switch (index) {
    case 0:
      return 'Lalezar';
    case 1:
      return 'Vazirmatn';
    default:
      return '';
  }
}

String name_app_bar(int index) {
  switch (index) {
    case 1:
      return 'صفحه اصلی';
    case 2:
      return 'جست وجو';
    case 3:
      return 'تنظیمات';
    default:
      return '';
  }
}

AppBar CustomAppBar(int index) => AppBar(
      title: Text(name_app_bar(index)),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.info_outlined), onPressed: () => Get.to(AboutUs())),
    );


