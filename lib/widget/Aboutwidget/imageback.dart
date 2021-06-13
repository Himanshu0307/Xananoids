import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  int i = 0;
  AnimationController _controller;
  Animation<double> _animationfade;

  // user defined Functions

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        reverseDuration: Duration(seconds: 4));

    _animationfade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //temp work

    Size pagesize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: firedata.get(),
        builder: (ctx, data) {
          if (data.connectionState == ConnectionState.done) {
            var _data = data.data as QuerySnapshot<Map<String, dynamic>>;
            _data.docs.forEach((element) {
              // print(element.id);
              // print(element.data());
              _name.add({
                'Quotes': element.data()['Quotes'],
                'URL': element.data()['ImageUrl']
              });
            });
            print(_name);

            return TimerBuilder.periodic(Duration(seconds: 11), builder: (ctx) {
              _controller.forward().whenComplete(() async {
                Timer(Duration(seconds: 5), () {
                  _controller.reverse();
                  i++;
                  if (_name.length - 1 == i) i = 0;
                });
              });

              return Stack(
                children: [
                  FadeTransition(
                    opacity: _animationfade,
                    child: Container(
                      height: pagesize.height * 0.8,
                      width: pagesize.width,
                      child: Image.network(
                        _name[i]['URL'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animationfade,
                    child: Container(
                      height: pagesize.height * 0.8,
                      width: pagesize.width,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        _name[i]['Quotes'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white70,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  )
                ],
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
