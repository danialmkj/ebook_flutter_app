import 'dart:convert';

import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/search_screen.dart';
import 'widgets/text_value_list.dart';

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

String nameAppBarChapter(int index) {
  switch (index) {
    case 0:
      return 'برنامه آموزشی';

    case 1:
      return 'فصل دوم';

    case 2:
      return 'فصل سوم';

    default:
      return 'فصل سوم';
  }
}

List<TextValue> parseJosn(String response) {
  if (response.isEmpty) {
    return [];
  }
  final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
  return parsed.map<TextValue>((json) => TextValue.fromJson(json)).toList();
}
/*


Widget fetchJsonData(BuildContext context) {
  return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/db/text_value.json'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        
        List<TextValue> text_values = parseJosn(snapshot.data.toString());

        SearchScreen(listTextValue: text_values);

        return text_values.isNotEmpty
            ? TextValueList(listTextValue: text_values)
            : Text("file is empty");
      });
}
*/



FutureBuilder<String> fetch_data(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/db/text_value.json'),
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

                return text_values.isNotEmpty ? TextValueList(listTextValue: text_values) : Text("file is empty");
              }
          }
        },
      );
  }


 FutureBuilder<String> fetch_data_search(BuildContext context , String query) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/db/text_value.json'),
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

                return text_values.isNotEmpty ? TextValueList(listTextValue: text_values) : Text("file is empty");
              }
          }
        },
      );
  }


 