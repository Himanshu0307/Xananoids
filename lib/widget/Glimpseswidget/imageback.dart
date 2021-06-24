import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gh/widget/Aboutwidget/function.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:flutter/material.dart';

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
              print(element.data());
              _name.add({'URL': element.data()['ImageUrl']});
            });
            return SizedBox(
              height: pagesize.height * 0.6,
              width: pagesize.width * 0.8,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 30,
                    mainAxisExtent: 30,
                    childAspectRatio: 1,
                    maxCrossAxisExtent: pagesize.height * 0.3),
                itemBuilder: (ctx, index) {
                  return Image.network(
                    _name[0]['URL'][index],
                    width: 50,
                    scale: 1,
                    loadingBuilder: (ctx, _, chuhnk) {
                      return CircularProgressIndicator();
                    },
                  );
                  // return Container();
                },
                itemCount: _name.length,
              ),
            );
          }
          return Text('Please Wait while loading');
        });
  }
}
