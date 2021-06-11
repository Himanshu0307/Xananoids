import 'package:flutter/material.dart';
import 'package:gh/widget/list_for_details.dart';

class InteractionPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height,
      child: ListForDetails(Size(pagesize.width * 0.6, pagesize.height * 0.6)),
    );
  }
}
