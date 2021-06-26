import 'package:flutter/material.dart';
import 'package:gh/widget/AboutWidget/information.dart';
import 'package:gh/widget/AboutWidget/videoplayer.dart';
import 'package:gh/widget/glimpses.dart';
import 'package:gh/widget/help.dart';
import 'package:gh/widget/interactionpage.dart';
import 'package:gh/widget/squadw.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _pagesize = MediaQuery.of(context).size;
    return Container(
      height: _pagesize.height * 0.8,
      width: _pagesize.width,
      child: PageView(
        controller: _pageController,
        allowImplicitScrolling: false,
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [VideoPlayerW(), Information()],
          ),
          Glimpses(),
          Squadw(),
          InteractionPage(),
          Help()
        ],
      ),
    );
  }
}
