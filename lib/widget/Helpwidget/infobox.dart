import 'package:flutter/material.dart';
import 'package:gh/data/helpdata.dart';

class InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _pagesize = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: _pagesize.height * 0.7,
        width: _pagesize.width * 0.9,
        child: Wrap(
          children: [
            ...(actions
                .map((e) => Card(
                      elevation: 5,
                      color: Colors.transparent,
                      child: SizedBox(
                        height: _pagesize.height * 0.3,
                        width: _pagesize.width * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(e['Icon']),
                            Text(
                              e['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(e['subtitle']),
                            ElevatedButton(
                              child: Text(e['button_text']),
                              onPressed: e['fun_to_call'],
                            )
                          ],
                        ),
                      ),
                    ))
                .toList()),
          ],
        ));
  }
}
