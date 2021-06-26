import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gh/screen/fullinfo.dart';

class AboutUs extends StatelessWidget {
  Widget build(BuildContext context) {
    Size _pagesize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showFullIInfo(
            context: context,
            content: 'We are People of Xananoids',
            title: 'About Us');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        height: _pagesize.height * 0.3,
        width: _pagesize.width * 0.5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Xananoids is a independent club launched by ....',
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  ElevatedButton(
                      onPressed: () => showFullIInfo(
                          context: context,
                          title: 'About Us',
                          content:
                              'Xananoids is a independent club launched by seniors of batch 2004.'),
                      child: Text('Full Info'))
                ],
              ),
              color: Colors.transparent,
            )),
      ),
    );
  }
}
