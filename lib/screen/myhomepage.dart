import 'package:flutter/material.dart';
import 'package:gh/fonts/social_icon_icons.dart';
import 'package:gh/widget/AboutWidget/information.dart';
import 'package:gh/widget/AboutWidget/videoplayer.dart';
import 'package:gh/widget/about.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/squadw.dart';
import '../widget/glimpses.dart';
import '../widget/help.dart';
import '../widget/interactionpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          backgroundColor: Colors.white60,
          elevation: 2.5,
          shadowColor: Colors.black38,
          title: Text('Xananoids')),
      body: Container(
        height: pagesize.height * 0.8,
        width: pagesize.width,
        child: PageView(
          controller: _pageController,
          // allowImplicitScrolling: false,
          scrollDirection: Axis.vertical,
          children: [
            Stack(children: [VideoPlayerW(), Information()]),
            Glimpses(),
            Squadw(),
            InteractionPage(),
            Help()
          ],
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          color: Colors.white54,
          height: pagesize.height,
          width: pagesize.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(0);
                    Navigator.of(context).pop();
                  },
                  child: Text('About')),
              TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(1);
                    Navigator.of(context).pop();
                  },
                  child: Text('Gallery')),
              TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                    Navigator.of(context).pop();
                  },
                  child: Text('Squad')),
              TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(3);
                    Navigator.of(context).pop();
                  },
                  child: Text('Projects')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(4);
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text('Contact Us'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: pagesize.height * 0.1,
        width: pagesize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Connect with us',
            ),
            IconButton(
                icon: Icon(SocialIcon.instagram),
                onPressed: () {
                  launch('https://www.instagram.com/xananoidsclub/');
                }),
            IconButton(
                icon: Icon(SocialIcon.linkedin),
                onPressed: () {
                  launch('https://www.linkedin.com/in/xananoids-club/');
                }),
            IconButton(
                icon: Icon(SocialIcon.github_circled),
                onPressed: () {
                  launch('https://www.github.com');
                })
          ],
        ),
      ),
    );
  }
}
