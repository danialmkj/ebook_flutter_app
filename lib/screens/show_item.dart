import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant.dart';

class ShowItem extends StatefulWidget {
  String? name;
  String? description;

  ShowItem({Key? key, this.name, this.description}) : super(key: key);

  @override
  State<ShowItem> createState() => ShowItemState();
}

class ShowItemState extends State<ShowItem> {
  List<bool>? isSelected;
  List<bool>? fontTypeList;
  double? fontSize = 17;
  String? font = '';

  List<String> fonts = ['lalezar', 'vazir', ''];

  @override
  void initState() {
    isSelected = [false, true, false];
    fontTypeList = [false, false, true];
    GoogleFonts.config.allowRuntimeFetching = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: !isLightTheme.value
            ? Colors.black54
            : Color.fromARGB(255, 246, 250, 253),
        appBar: AppBar(
          title: const Text(
            'جزئیات',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.blue[50],
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  widget.name!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
                childrenPadding: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.description!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                          style: font == ''
                              ? TextStyle(
                                  color: Colors.black, fontSize: fontSize)
                              : GoogleFonts.getFont(font!,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      ToggleButtons(
                        children: [
                          Text(
                            'F',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Text(
                            'F',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            'F',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )
                        ],
                        isSelected: isSelected!,
                        onPressed: (index) {
                          for (var i = 0; i < isSelected!.length; i++) {
                            if (i == index) {
                              isSelected![i] = true;
                            } else {
                              isSelected![i] = false;
                            }
                          }
                          fontSize = getFontSize(index);
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ToggleButtons(
                        children: [
                          Text(
                            'لاله زار',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Text(
                            'وزیر',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Text(
                            '',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ],
                        isSelected: fontTypeList!,
                        onPressed: (index) {
                          for (var i = 0; i < fonts.length; i++) {
                            if (i == index) {
                              font = fonts[i];
                              fontTypeList![i] = true;
                            } else {
                              fontTypeList![i] = false;
                            }
                          }
                          font = getFontType(index);
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
