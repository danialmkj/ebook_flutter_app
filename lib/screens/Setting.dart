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
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SwitchListTile(
              title: Text(
                Get.isDarkMode ? 'Light Theme':'Dark Theme',
                style: Theme.of(context).textTheme.headline5,
              ),
              value: Get.isDarkMode ? true : false,
              onChanged: (value) {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              })),
    );
  }
}
