import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart' as cloud;

class Squadw extends StatefulWidget {
  @override
  _SquadwState createState() => _SquadwState();
}

class _SquadwState extends State<Squadw> with SingleTickerProviderStateMixin {
  //static variable
  var firedata = FirebaseFirestore.instance.collection('Squad');
  List _name = [];
  int i = 0;
  AnimationController _controller;
  Animation<double> _animation;

  // user defined Functions

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        reverseDuration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Function to show Modal Sheet
  void modalsheetopen(
      BuildContext ctx, Map<String, Object> data, Size _pagesize) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) {
          return Container(
            color: Colors.transparent,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(data['URL']),
                ),
                ClipRRect(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.white70,
                    width: _pagesize.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data['Name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(data['Year']),
                        Wrap(
                          spacing: 15,
                          children: [
                            ...((data['Field'] as List<dynamic>)
                                .map((e) => Text('\u2022' + e.toString())))
                          ],
                        )
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: firedata.get(),
        builder: (ctx, data) {
          if (data.connectionState == ConnectionState.done) {
            var _data = data.data as QuerySnapshot<Map<String, dynamic>>;
            _data.docs.forEach((element) {
              print(element.id);
              print(element.data());
              _name.add({
                'Name': element.id,
                'Year': element.data()['Year'],
                'URL': element.data()['URL'],
                'Field': element.data()['Field']
              });
            });

            return TimerBuilder.periodic(Duration(seconds: 11), builder: (ctx) {
              _controller.forward().whenComplete(() async {
                Timer(Duration(seconds: 5), () {
                  _controller.reverse();
                  if (_name.length % 3 == 0 &&
                      i == (_name.length / 3).truncate()) i = -1;
                  if (_name.length % 3 != 0 &&
                      i == (_name.length / 3).truncate() + 1) i = -1;
                  i++;
                });
              });
              return Container(
                height: pagesize.height * 0.8,
                width: pagesize.width,
                padding: EdgeInsets.all(9),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...(_name
                        .skip(i * 3)
                        .take(3)
                        .map((e) => GestureDetector(
                              onTap: () => modalsheetopen(ctx, e, pagesize),
                              child: FadeTransition(
                                opacity: _animation,
                                child: SizedBox(
                                  height: pagesize.height * 0.2,
                                  width: pagesize.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        flex: 1,
                                        child: CircleAvatar(
                                          radius: pagesize.width * 0.3,
                                          backgroundImage: NetworkImage(
                                            e['URL'],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: SizedBox(
                                          height: pagesize.height * 0.2,
                                          width: pagesize.width * 0.55,
                                          child: Card(
                                            borderOnForeground: true,
                                            child: ListTile(
                                              contentPadding: EdgeInsets.all(2),
                                              minVerticalPadding: 6,
                                              title: Text(
                                                e['Name'].toString(),
                                                style: TextStyle(
                                                    color: Colors.brown),
                                              ),
                                              subtitle: Text(e['Year'],
                                                  style: TextStyle(
                                                      color: Colors.brown)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList())
                  ],
                ),
              );
            });
          }
          return Center(
              child: Text(
            'Please wait while loading...',
            style: TextStyle(fontSize: 30),
          ));
        });
  }
}
