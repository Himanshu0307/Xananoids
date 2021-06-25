import 'package:flutter/material.dart';

void showFullImage({@required String url, @required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.network(url, fit: BoxFit.contain,
                  loadingBuilder: (ctx, child, loading) {
                if (loading == null) return child;
                return Center(child: CircularProgressIndicator());
              }),
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
