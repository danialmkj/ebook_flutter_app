import 'package:ebook_flutter_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => SettingState();
}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                      'تغییر تم',
                      style: TextStyle(fontSize: 20.0),
                  ),
                  ObxValue(
                    (data) => Switch(
                      value: isLightTheme.value,
                      onChanged: (val) {
                        isLightTheme.value = val;
                        Get.changeThemeMode(
                          isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                        );
                        saveThemeStatus();
                      },
                    ),
                    false.obs,
                  ),
                ],
              ),
          ),));
  }
}
