import 'package:flutter/material.dart';
import 'package:gh/widget/Interactionpagewidget/list_for_details.dart';

class InteractionPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height,
      child: ListForDetails(),
    );
  }
}
