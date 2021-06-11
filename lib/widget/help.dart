import 'package:flutter/material.dart';
import 'package:gh/widget/Helpwidget/contactform.dart';

class Help extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height,
      child: ContactForm(Size(pagesize.width * 0.6, pagesize.height * 0.4)),
    );
  }
}
