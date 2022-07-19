import 'package:ebook_flutter_app/main.dart';
import 'package:ebook_flutter_app/screens/home_screen.dart';
import 'package:ebook_flutter_app/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../model/text_value.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/db/text_value.json'),
                builder: (context, snapshot) {
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
                        List<TextValue> text_values =
                            parseJosn(snapshot.data.toString());

                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: height - 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: SingleChildScrollView(
                              child: Text(
                            text_values[0].description!,
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: isLightTheme.value
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          )),
                        );
                      }
                  }
                }),
            InkWell(
              onTap: () => 
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyApp())),
              Get.to(MyAppComplete()),
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
