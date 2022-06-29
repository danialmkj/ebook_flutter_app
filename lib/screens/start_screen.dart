import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebook_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeApplication extends StatelessWidget {
  const WelcomeApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: height - 100,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0)),
              child: const AutoSizeText(
                '',
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => HomeScreen()),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'شروع',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                decoration: BoxDecoration(
                    color: Colors.indigo[400],
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black54, width: 1.0)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
