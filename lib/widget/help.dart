import 'package:flutter/material.dart';
// import './Helpwidget/contactform.dart';
import './Helpwidget/infobox.dart';

class Help extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height * 0.7,
      child: Stack(
        children: [
          SizedBox(
            height: pagesize.height * 0.8,
            width: pagesize.width,
            child: Image.asset(
              "lib/assets/contact.jpeg",
              semanticLabel: 'Image',
              fit: BoxFit.fill,
            ),
          ),
          InfoBox(),
        ],
      ),
    );
  }
}
