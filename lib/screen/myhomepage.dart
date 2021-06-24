import 'package:flutter/material.dart';
import 'package:gh/fonts/social_icon_icons.dart';
import 'package:gh/widget/about.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/squadw.dart';
import '../widget/glimpses.dart';
import '../widget/help.dart';
import '../widget/interactionpage.dart';

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          elevation: 2.5,
          shadowColor: Colors.black38,
          title: TabBar(
            isScrollable: true,
            labelColor: Colors.black54,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            tabs: [
              Tab(
                text: 'About',
              ),
              Tab(
                text: 'Gallery',
              ),
              Tab(
                text: 'Squad',
              ),
              Tab(
                text: 'Interaction Page',
              ),
              Tab(
                text: 'Contact Us',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [About(), Glimpses(), Squadw(), InteractionPage(), Help()],
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
      ),
    );
  }
}
