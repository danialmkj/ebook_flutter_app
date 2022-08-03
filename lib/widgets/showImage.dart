// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  String? title;
  String? image;

  ShowImage({
    Key? key,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: Center(child: Image(image: AssetImage(image!))),
    );
  }
}
