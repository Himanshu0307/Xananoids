import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gh/widget/imageback.dart';

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height,
      width: pagesize.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageBack(),
          Column(
            children: [
              Text(
                'Hack The World',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white70),
              ),
            ],
          )
        ],
      ),
    );
  }
}
