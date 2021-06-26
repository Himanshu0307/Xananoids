import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gh/screen/fullimage.dart';
import 'package:gh/widget/Glimpseswidget/curosilimageview.dart';

class ImageBack extends StatefulWidget {
  @override
  _ImageBackState createState() => _ImageBackState();
}

class _ImageBackState extends State<ImageBack>
    with SingleTickerProviderStateMixin {
  //static variable
  var firedata = FirebaseFirestore.instance.collection('BackImage');
  List _name = [];

  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: firedata.get(),
        builder: (ctx, data) {
          if (data.hasError) return Text("Please Try again Later..");
          var _data = data.data as QuerySnapshot<Map<String, dynamic>>;
          if (data.connectionState == ConnectionState.done) {
            _data.docs.forEach((element) {
              _name.add({'URL': element.data()['ImageUrl']});
            });
            return CuroselImageView(_name[0]['URL']);
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
