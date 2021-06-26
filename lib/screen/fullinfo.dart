import 'dart:html';

import 'package:flutter/material.dart';

void showFullIInfo(
    {String title, String content, @required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(title), Text(content)],
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back')),
            )
          ],
        );
      });
}
