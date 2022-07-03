// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:ebook_flutter_app/model/text_value.dart';
import 'package:ebook_flutter_app/widgets/text_value_list.dart';

class InDetail extends StatelessWidget {
  List<TextValue>? data;
  int indexChapter;

  InDetail({
    Key? key,
    required this.indexChapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            nameAppBarChapter(indexChapter),
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: fetch_data(context));
  }
}
