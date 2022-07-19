import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/screens/in_detail.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(1),
        body: Center(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            children: [
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: InDetail(indexChapter: 0),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.slideRight,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: Image.asset('assets/images/logo1.png',
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1),
                        ),
                        AutoSizeText('حداقل نیاز های برنامه',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: ''),),
                      ]),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 6.0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: InDetail(
                    indexChapter: 1,
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.slideRight,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/logo2.png',
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.1),
                        AutoSizeText('برنامه آموزشی',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl),
                      ]),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 6.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: InDetail(
                    indexChapter: 2,
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.slideRight,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/logo3.png',
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.1),
                        AutoSizeText('ارزشیابی ',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl),
                      ]),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 6.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: InDetail(
                    indexChapter: 3,
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.slideRight,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/logo4.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.1),
                      AutoSizeText('مشخصات دوره',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 6.0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
