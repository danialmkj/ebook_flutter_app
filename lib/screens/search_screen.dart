import 'dart:convert';
import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/model/image.dart';
import 'package:ebook_flutter_app/model/new_image.dart';
import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:ebook_flutter_app/screens/show_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../widgets/showImage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List textValues = [];
  List original = [];
  List result = [];
  TextEditingController txtQuery = TextEditingController();

  NewImage? myImage;
  TextValue? textValue;

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/db/text_value.json');
    var json = jsonDecode(jsonStr);
    textValues = json;
    original = json;
    setState(() {});
  }

  void loadImage() async {
    String jsonStr = await rootBundle.loadString('assets/db/image_db.json');
    var json = jsonDecode(jsonStr);
    textValues = json;
    original = json;
    print('load Image is running....');
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      textValues = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    textValues.forEach((element) {
      String id = element["id"].toString().toLowerCase();
      String name = element["name"].toString().toLowerCase();
      String description = element["description"].toString().toLowerCase();
      if (name == query || description == query) {
        textValue = TextValue(name: name, description: description);
        result.add(textValue);
      }
    });

    textValues = result;
  }

  void searchById(String query1) {
    if (query1.isEmpty) {
      textValues = original;
      print('we don\'t have lesson code for.....$query1');
      setState(() {});
      return;
    }

    textValues.forEach((element) {
      String id = element["id"].toString();
      String id_num = element["id_num"].toString();
      String img_num = element["img_num"].toString();
      if (id_num == query1) {
        myImage = NewImage(id: id, id_num: id_num, img_num: img_num);
        result.add(myImage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(2),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: txtQuery,
                    onChanged: (value) {
                      if (isNumeric(txtQuery.text) == true) {
                        loadImage();
                        searchById(value);
                        print(
                            'I\'m using search option for loading Image.... ');
                      } else {
                        loadData();
                        search(value);
                        print('I\'m using search option for loading Data....');
                        //}
                      }
                    },
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: "جست وجو...",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'iran-sans-ds',
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.italic,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          txtQuery.text = '';
                          txtQuery.clear();
                        },
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            txtQuery.text.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        //result.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin:
                                const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.blue[50],
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: InkWell(
                                onTap: (() => pushNewScreen(
                                      context,
                                      screen: isNumeric(txtQuery.text) == false
                                          ? ShowItem(
                                              name: textValue?.name ?? '',
                                              description:
                                                  textValue?.description ?? '',
                                            )
                                          : ShowImage(
                                              title: myImage?.id_num ?? '',
                                              image: Myasset(
                                                  myImage?.img_num ?? ''),
                                            ),
                                      withNavBar:
                                          true, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.slideRight,
                                    )),
                                child: ExpansionTile(
                                  title: Text(
                                    isNumeric(txtQuery.text) == false
                                        ? textValue?.name ?? ''
                                        : myImage?.id_num ?? '',
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                        fontSize: 20.0, color: Colors.black54),
                                  ),
                                  childrenPadding: const EdgeInsets.only(
                                      bottom: 20.0,
                                      right: 20.0,
                                      left: 20.0,
                                      top: 5.0),
                                  children: [
                                    isNumeric(txtQuery.text) == false
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                                const Text(
                                                  'بیشتر',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${textValue?.description?.substring(0, 39)} ...' ??
                                                      '',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ])
                                        : Image.asset(
                                            Myasset(myImage?.img_num ?? ''),
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 150,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
          ]),
    );
  }
}
