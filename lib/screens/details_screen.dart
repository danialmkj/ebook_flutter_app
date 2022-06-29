import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebook_flutter_app/screens/Setting.dart';
import 'package:ebook_flutter_app/screens/custom_in_detail.dart';
import 'package:ebook_flutter_app/screens/in_detail.dart';
import 'package:ebook_flutter_app/values/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Get.to(Setting()),
          icon: Icon(
            Icons.settings,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: size.height * .02,
                        bottom: size.height * .2,
                        left: size.width * .05,
                        right: size.width * .05),
                    height: size.height * .5,
                    decoration: const BoxDecoration(
                      //color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: custom_blue_card()
                    // BookInfo(
                    //   size: size,
                    //)
                    ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .25 - 20),
                  child: Column(
                    children: <Widget>[
                      ChapterCard(
                          name: "فصل اول",
                          press: () => Get.to(InDetail(
                                chapterNumber: 1,
                              ))),
                      ChapterCard(
                        name: "فصل دوم",
                        press: () => Get.to(InDetail(
                          chapterNumber: 2,
                        )),
                      ),
                      ChapterCard(
                        name: "فصل سوم",
                        press: () => Get.to(CustomInDetail()),
                      ),
                      ChapterCard(
                        name: "فصل چهارم",
                        press: () => Get.to(InDetail(
                          chapterNumber: 4,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget custom_blue_card() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
      ),
      child: Center(
          child: AutoSizeText(
        custom_text_main,
        style: const TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'iran-sans'),
        textAlign: TextAlign.center,
      )),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String? name;
  final String? tag;
  final int? chapterNumber;
  final VoidCallback? press;

  const ChapterCard({
    Key? key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: const EdgeInsets.only(bottom: 14),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 10,
            color: const Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "عنوان  : $name \n",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}
