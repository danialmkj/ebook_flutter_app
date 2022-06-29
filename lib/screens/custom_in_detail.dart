import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class CustomInDetail extends StatefulWidget {
  const CustomInDetail({Key? key}) : super(key: key);

  @override
  State<CustomInDetail> createState() => CustomInDetailState();
}

class CustomInDetailState extends State<CustomInDetail> {
   PdfViewerController? _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  PdfTextSearchResult? _searchResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('فصل سوم'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {
                _searchResult = (await _pdfViewerController!.searchText('the',
                    searchOption: TextSearchOption.caseSensitive));
                setState(() {});
              },
            ),
            Visibility(
              visible: _searchResult?.hasResult ?? false,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _searchResult!.clear();
                  });
                },
              ),
            ),
            Visibility(
              visible: _searchResult?.hasResult ?? false,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult?.previousInstance();
                },
              ),
            ),
            Visibility(
              visible: _searchResult?.hasResult ?? false,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult?.nextInstance();
                },
              ),
            ),
          ],
        ),
        body: SfPdfViewer.asset(
          'assets/pdfs/chapter_three.pdf',
          controller: _pdfViewerController,
          currentSearchTextHighlightColor: Colors.orange,
          otherSearchTextHighlightColor: Colors.yellow,
        ));
  }
}
