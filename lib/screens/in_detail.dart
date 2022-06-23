import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebook_flutter_app/values/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InDetail extends StatefulWidget {
  int? chapterNumber;

  InDetail({Key? key, this.chapterNumber}) : super(key: key);

  @override
  State<InDetail> createState() => _InDetailState();
}

class _InDetailState extends State<InDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: widget_name_text(widget.chapterNumber),
        centerTitle: true,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       // _pdfViewerStateKey.currentState!.openBookmarkView();
          //     },
          //     icon: Icon(
          //       Icons.bookmark,
          //       color: Colors.white,
          //     )),
          // IconButton(
          //     onPressed: () {
          //       //_pdfViewerController.jumpToPage(5);
          //     },
          //     icon: Icon(
          //       Icons.arrow_drop_down_circle,
          //       color: Colors.white,
          //     )),
          // IconButton(
          //     onPressed: () {
          //       //_pdfViewerController.zoomLevel = 1.25;
          //     },
          //     icon: Icon(
          //       Icons.zoom_in,
          //       color: Colors.white,
          //     ))
          //IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded))
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('جستجو'), onTap: () {}),
                    PopupMenuItem(
                      child: Text('ذخیره شده'),
                      onTap: () {},
                    ),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
          child: AutoSizeText(
            widget_text(widget.chapterNumber!),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
            //style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

//need to complete
  String widget_text(int? index) {
    print(
        'my index is ................................................  $index');
    switch (index) {
      case 1:
        return text_value1;

      case 2:
        return text_value2;

      case 3:
        return text_value3;

      case 4:
        return text_value4;
    }

    return '';
  }

  Text widget_name_text(int? chapterNumber) {
    print('chapterNumber is $chapterNumber');
    switch (chapterNumber) {
      case 1:
        return Text('فصل اول');

      case 2:
        return Text('فصل دوم');

      case 3:
        return Text('فصل سوم');

      case 4:
        return Text('فصل چهارم');
    }

    return Text('');
  }
}
