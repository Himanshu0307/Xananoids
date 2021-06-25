import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gh/screen/fullimage.dart';

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
              // print(element.data()['ImageUrl'][0]);
              _name.add({'URL': element.data()['ImageUrl']});
              // print(_name);
            });
            return SizedBox(
              height: pagesize.height * 0.6,
              width: pagesize.width * 0.8,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 200,
                    childAspectRatio: 1,
                    maxCrossAxisExtent: pagesize.height * 0.6),
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      showFullImage(
                          url: _name[0]['URL'][index], context: context);
                    },
                    child: Container(
                        width: 660,
                        height: 660,
                        child: Image.network(_name[0]['URL'][index],
                            fit: BoxFit.fill,
                            loadingBuilder: (ctx, child, loading) {
                          if (loading == null) return child;
                          return Center(child: CircularProgressIndicator());
                        })),
                  );
                  // return Container();
                },
                itemCount: _name[0]['URL'].length,
              ),
            );
          }
          return Text('Please Wait while loading');
        });
  }
}
