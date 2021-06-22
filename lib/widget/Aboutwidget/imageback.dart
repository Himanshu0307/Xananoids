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

  int transition(_controller, i, _name) {
    int loop = i;
    _controller.forward().whenComplete(() async {
      Timer(Duration(seconds: 5), () {
        _controller.reverse();
        loop++;
        print(loop.toString());
        // if (_name.length - 1 == loop) loop = 0;
      });
      // print(i);
    });
    print('Out: ' + loop.toString());
    return loop;
  }

  @override
  Widget build(BuildContext context) {
    //temp work

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

            return TimerBuilder.periodic(Duration(seconds: 11), builder: (ctx) {
              i = transition(_controller, i, _name);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              i = transition(_controller, i - 1, _name);
                            });
                          },
                          icon: Icon(Icons.skip_previous)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              i = transition(_controller, i + 1, _name);
                            });
                          },
                          icon: Icon(Icons.skip_next))
                    ],
                  )
                ],
              );
            });
          }
          return Text('Please Wait while loading');
        });
  }
}
