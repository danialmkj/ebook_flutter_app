import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ebook_flutter_app/model/image.dart';
import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:ebook_flutter_app/screens/show_item.dart';
import 'package:ebook_flutter_app/widgets/my_string.dart';
import 'package:ebook_flutter_app/widgets/showImage.dart';
import '../constant.dart';

class TextValueList extends StatefulWidget {
  final List<TextValue>? listTextValue;
  final int? index;

  TextValueList({
    Key? key,
    this.listTextValue,
    this.index,
  }) : super(key: key);

  @override
  State<TextValueList> createState() => _TextValueListState();
}

class _TextValueListState extends State<TextValueList> {
  List<TextValue>? myList;

  @override
  Widget build(BuildContext context) {
    List<String> list_items = [
      'مشخصات کلی دوره',
      'جدول دروس عمومی',
      'جدول دروس اختصاصی',
      'جدول برخی دروس انتخابی اختصاصی(Non core)',
      'جدول برخی چرخشهای انتخابی(non core) کارورزی بالینی',
    ];


    List<TextValue> getCategoryList(List<TextValue> inputList, int index) {
      List<TextValue> outputList = inputList
          .where((o) => o.title!.contains('text_value$index'))
          .toList();
      myList = outputList;
      return outputList;
    }

    return widget.index != 2
        ? ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: getCategoryList(widget.listTextValue!, widget.index! + 1)
                .length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.blue[50],
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: InkWell(
                    onTap: () => pushNewScreen(
                      context,
                      screen: ShowItem(
                          name: myList![index].name!,
                          description: myList![index].description!),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        myList![index].name!,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black54),
                      ),
                      childrenPadding: const EdgeInsets.only(
                          bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                      children: [
                        myList![index].description!.length > 200
                            ? RichText(
                                text: TextSpan(
                                    text: myList![index]
                                            .description!
                                            .substring(0, 198) +
                                        '...',
                                    style: TextStyle(color: Colors.black),
                                    children: const [
                                      TextSpan(
                                          text: ' ',
                                          style: TextStyle(color: Colors.blue)),
                                      TextSpan(
                                          text: 'بیشتر',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                              )
                            : Text(
                                myList![index].description!,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: isLightTheme.value
                                        ? Colors.black
                                        : Colors.white),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : ListView(padding: const EdgeInsets.all(8.0), children: [
            Card(
                margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.blue[50],
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      list_items[0],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black54),
                    ),
                    childrenPadding: const EdgeInsets.only(
                        bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                    children: [
                      Text(subtitle1!, textDirection: TextDirection.rtl),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.02,
                        ),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                            onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: list_items[0],
                                    image: Myasset('1'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                            child: Image.asset(Myasset('1'))),
                      ),
                      Text(
                        subtitle2!,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: AutoSizeText(
                          description!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                )),

            Card(
              margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    title: Text(
                      list_items[1],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black54),
                    ),
                    childrenPadding: const EdgeInsets.only(
                        bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                            onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: list_items[1],
                                    image: Myasset('2'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                            child: Image.asset(Myasset('2'))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                          onTap: () => pushNewScreen(
                            context,
                            screen: ShowImage(
                              title: list_items[1],
                              image: Myasset('3'),
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          child: Image.asset(Myasset('3')),
                        ),
                      )
                    ]),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    title: Text(
                      list_items[2],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black54),
                    ),
                    childrenPadding: const EdgeInsets.only(
                        bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                            onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: list_items[2],
                                    image: Myasset('4'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                            child: Image.asset(
                              Myasset('4'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Colors.amber,
                        child: InkWell(
                          onTap: () => pushNewScreen(
                            context,
                            screen: ShowImage(
                              title: list_items[2],
                              image: Myasset('5'),
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          child: Image.asset(
                            Myasset('5'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                            onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: list_items[2],
                                    image: Myasset('6'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                            child: Image.asset(
                              Myasset('6'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                          onTap: () => pushNewScreen(
                            context,
                            screen: ShowImage(
                              title: list_items[2],
                              image: Myasset('7'),
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          child: Image.asset(
                            Myasset('7'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                          onTap: () => pushNewScreen(
                            context,
                            screen: ShowImage(
                              title: list_items[2],
                              image: Myasset('8'),
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          child: Image.asset(Myasset('8'), fit: BoxFit.cover),
                        ),
                      ),
                    ]),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    title: Text(
                      list_items[3],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black54),
                    ),
                    childrenPadding: const EdgeInsets.only(
                        bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: InkWell(
                            onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: list_items[3],
                                    image: Myasset('9'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                            child: Image.asset(
                              Myasset('9'),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ]),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    title: Text(
                      list_items[4],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black54),
                    ),
                    childrenPadding: const EdgeInsets.only(
                        bottom: 20.0, right: 20.0, left: 20.0, top: 5.0),
                    children: [
                      InkWell(
                        onTap: ()=> pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: 'کارورزی',
                                    image: Myasset('10'),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                        child: ExpansionTile(
                          title: Text('کارورزی'),
                          children: [Image.asset(Myasset('10'))],
                        ),
                      ),
                      FutureBuilder(
                        future: DefaultAssetBundle.of(context)
                            .loadString('assets/db/image_db.json'),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Text('Press button to start.');
                            case ConnectionState.active:
                            case ConnectionState.waiting:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Text('Error is: ${snapshot.error}');
                              } else  {
                                
                                final List<MyImage> data = parseImage(snapshot.data);

                                return ListView.builder(
                                    itemBuilder: (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () => pushNewScreen(
                                  context,
                                  screen: ShowImage(
                                    title: data[index].id_num!.toString(),
                                    image: Myasset(data[index].img_num!.toString()),
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                ),
                                        child: ExpansionTile(
                                          title: Text(data[index].id_num!.toString() , style: TextStyle(fontFamily: 'lalezar'),),
                                          children: [
                                            Image.asset(Myasset(data[index].img_num!.toString()))
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: data.length,
                                    shrinkWrap: true);
                              }
                          }
                        },
                      ),
                    ]),
              ),
            ),
          ]);
  }

}
