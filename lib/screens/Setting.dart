import 'package:ebook_flutter_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => SettingState();
}

class SettingState extends State<Setting> {
  String dropdownValue = '';
  int currentValue = 16;

  List<String> fontList = ['', 'بی نازنین', 'ایران سنس', 'ایران سنس دست نویس'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(3),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ObxValue(
                      (data) => Switch(
                        value: isLightTheme.value,
                        onChanged: (val) {
                          isLightTheme.value = val;
                          Get.changeThemeMode(
                            isLightTheme.value
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          );
                          saveThemeStatus();
                        },
                      ),
                      false.obs,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: const Text(
                        'تغییر تم',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Divider(
                      color: isLightTheme.value ? Colors.black : Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (newValue) async {
                          dropdownValue = newValue!;
                          setState(() async {
                            // setFontType(dropdownValue);
                            // await updateFontType(dropdownValue);
                          });
                        },
                        items: fontList
                            .map((String item) => DropdownMenuItem<String>(
                                child: Text(item), value: item))
                            .toList(),
                        alignment: Alignment.center,
                      ),
                      const Text(
                        'نوع فونت',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        //textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: isLightTheme.value ? Colors.black : Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NumberPicker(
                        itemCount: 1,
                        value: currentValue,
                        minValue: 10,
                        maxValue: 20,
                        onChanged: (value) async {
                          currentValue = value;
                          // setFontSize(currentValue);
                          // await updateFontSize(currentValue.toDouble());
                        }),
                    const Text(
                      'سایز فونت ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
