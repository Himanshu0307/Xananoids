import 'package:flutter/material.dart';
import 'package:gh/fonts/social_icon_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/squadw.dart';
import '../widget/about.dart';
import '../widget/help.dart';
import '../widget/interactionpage.dart';

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
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
                text: 'Glimpses',
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
          children: [About(), Squadw(), InteractionPage(), Help()],
        ),
        bottomNavigationBar: Container(
          height: pagesize.height * 0.1,
          width: pagesize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Follow Us on Social Handler',
              ),
              IconButton(
                  icon: Icon(SocialIcon.instagram),
                  onPressed: () {
                    launch('https://www.instagram.com');
                  }),
              IconButton(
                  icon: Icon(SocialIcon.linkedin),
                  onPressed: () {
                    launch('https://www.linkedin.com');
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
