// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ebook_flutter_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:ebook_flutter_app/model/text_value.dart';

class InDetail extends StatelessWidget {
  List<TextValue>? data;
  int? indexChapter;

  InDetail({
    Key? key,
    this.indexChapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            nameAppBarChapter(indexChapter!),
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: fetch_data(context, indexChapter!));
  }
}
