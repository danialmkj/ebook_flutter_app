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
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: !isSearching
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back))
              : IconButton(
                  onPressed: () {
                    //it's for search...
                    // listSearching(searchController.text,
                    //     widget_text(widget.chapterNumber!));
                  },
                  icon: Icon(Icons.search)),
          title: !isSearching
              ? widget_name_text(widget.chapterNumber)
              : TextField(
                  controller: searchController,
                  textDirection: TextDirection.rtl,
                  textInputAction: TextInputAction.none,
                  decoration: const InputDecoration(
                    hintText: 'جست وجو....',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
            // PopupMenuButton(
            //     itemBuilder: (context) => [
            //           PopupMenuItem(child: Text('جستجو'), onTap: () {}),
            //           PopupMenuItem(
            //             child: Text('ذخیره شده'),
            //             onTap: () {},
            //           ),
            //         ]),
            // IconButton(
            //     icon: customIcon,
            //     onPressed: () {
            //       onPressed:
            //       () {
            //         setState(() {
            //           if (customIcon.icon == Icons.search) {
            //             customIcon = const Icon(Icons.cancel);
            //             customSearchBar = const ListTile(
            //               leading: Icon(
            //                 Icons.search,
            //                 color: Colors.white,
            //                 size: 28,
            //               ),
            //               title: TextField(
            //                 decoration: InputDecoration(
            //                   hintText: 'type in journal name...',
            //                   hintStyle: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 18,
            //                     fontStyle: FontStyle.italic,
            //                   ),
            //                   border: InputBorder.none,
            //                 ),
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             );
            //           } else {
            //             customIcon = const Icon(Icons.search);
            //             customSearchBar = const Text('My Personal Journal');
            //           }
            //         });
            //       };
            //     })
            !isSearching
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: Text('جستجو'),
                              onTap: () {
                                setState(() {
                                  isSearching = true;
                                });
                              }),
                          PopupMenuItem(
                            child: Text('ذخیره شده'),
                            onTap: () {},
                          ),
                        ])
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                      });
                    },
                    icon: Icon(Icons.clear))
          ]),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            child: AutoSizeText(
              widget_text(widget.chapterNumber!),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            )),
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
