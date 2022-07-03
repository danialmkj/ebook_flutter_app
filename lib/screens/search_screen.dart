import 'dart:convert';

import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:ebook_flutter_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List textValues = [];
  List original = [];
  TextEditingController txtQuery = TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/db/text_value.json');
    var json = jsonDecode(jsonStr);
    textValues = json;
    original = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      textValues = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    textValues.forEach((element) {
      var name = element["name"].toString().toLowerCase();
      var description = element["description"].toString().toLowerCase();
      if (name.contains(query) || description.contains(query)) {
        result.add(element);
      }
    });

    textValues = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onChanged: search,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: "جست وجو...",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(
                        color: isLightTheme.value == true
                            ? Colors.black
                            : Colors.white,
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
                          search(txtQuery.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            txtQuery.text.isEmpty ? Container() : _listView(textValues)
          ]),
    );
  }
}

Widget _listView(text_value) {
  return Expanded(
    child: ListView.builder(
        itemCount: text_value.length,
        itemBuilder: (context, index) {
          var textVal = text_value[index];
          return Card(
            margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.blue[50],
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  textVal['name'],
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
                childrenPadding: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                children: [
                  Text(
                    textVal['description'],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
                
              ),
          );
        }),
  );
}