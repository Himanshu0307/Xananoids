import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gh/widget/Glimpseswidget/imageback.dart';

class Glimpses extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Image.asset(
            'lib/assets/wooden.jpg',
            height: pagesize.height,
            width: pagesize.width,
            fit: BoxFit.fill,
          ),
        ),
        ImageBack(),
      ],
    );
  }
}
