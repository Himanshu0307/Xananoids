import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListForDetails extends StatelessWidget {
  Size pagesize;
  List<String> get postdoc {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    pagesize = MediaQuery.of(context).size;
    var firedata = FirebaseFirestore.instance
        .collection('Interaction')
        .snapshots(includeMetadataChanges: true);
    return Container(
      padding: const EdgeInsets.all(10),
      height: pagesize.height * 0.8,
      width: pagesize.width,
      child: StreamBuilder(
          stream: firedata,
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return Text('Loading...');
            if (snap.hasError) return Text('Please Try again later');
            var _data = snap.data as QuerySnapshot<Map<String, dynamic>>;
            int length = _data.docs.length;

            return ListView.builder(
              itemBuilder: (ctx, i) => Card(
                elevation: 5,
                child: Container(
                  height: pagesize.height * 0.7,
                  width: pagesize.width,
                  child: GridTile(
                    child: Container(),
                    header: SizedBox(
                      height: pagesize.height * 0.15,
                      width: pagesize.width,
                      child: GridTileBar(
                        title: Text(
                          'Title : ' +
                              _data.docs[length - (i + 1)].data()['Title'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                            'Description : ' +
                                _data.docs[length - (i + 1)]
                                    .data()['Description'],
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    footer: SizedBox(
                        height: pagesize.height * 0.55,
                        width: pagesize.width,
                        child: Text('This is a post shared by Admin')),
                  ),
                ),
              ),
              itemCount: _data.docs.length,
            );
          }),
    );
  }
}
