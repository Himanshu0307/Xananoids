import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gh/screen/fullimage.dart';
import 'package:gh/widget/Interactionpagewidget/cardproject.dart';

class ListForDetails extends StatelessWidget {
  Size pagesize;
  List<Map> postdoc = [];

  @override
  Widget build(BuildContext context) {
    pagesize = MediaQuery.of(context).size;
    var firedata = FirebaseFirestore.instance
        .collection('Projects')
        .snapshots(includeMetadataChanges: true);
    return StreamBuilder(
        stream: firedata,
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snap.hasError) return Text('Please Try again later');

          (snap.data as QuerySnapshot<Map<String, dynamic>>)
              .docs
              .forEach((element) {
            postdoc.add({
              'Url': element.data()['Imageurl'][0],
              'Description': element.data()['Description'],
              'Title': element.data()['Title']
            });
          });
          print(postdoc);
          return Container(
            height: pagesize.height * 0.5,
            width: pagesize.width * 0.4,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return CardProject(
                  title: postdoc[index]['Title'],
                  imageUrl: postdoc[index]['Url'],
                  description: postdoc[index]['Description'],
                );
              },
              itemCount: postdoc.length,
            ),
          );
        });
  }
}
