import 'package:flutter/material.dart';
import 'package:gh/data/helpdata.dart';

class InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _pagesize = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: _pagesize.height * 0.3,
        width: _pagesize.width * 0.9,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: Colors.transparent,
              child: SizedBox(
                height: _pagesize.height * 0.15,
                width: _pagesize.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(actions[index]['Icon']),
                    Text(
                      actions[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(actions[index]['subtitle']),
                    TextButton(
                      child: Text(actions[index]['button_text']),
                      onPressed: actions[index]['fun_to_call'],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ));
  }
}
