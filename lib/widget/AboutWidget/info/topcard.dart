import 'package:flutter/material.dart';
import 'package:gh/screen/fullinfo.dart';

class TopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _pagesize = MediaQuery.of(context).size;
    return Wrap(
      direction: Axis.horizontal,
      children: [
        InkWell(
          onTap: () => showFullIInfo(
              context: context,
              content: 'Our Mission is Simple',
              title: 'Our Mission'),
          child: Container(
            height: _pagesize.height * 0.3,
            width: _pagesize.width * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Our Mision'),
                    ElevatedButton(
                        onPressed: () => showFullIInfo(
                            context: context,
                            title: 'mision',
                            content: 'This is Content'),
                        child: Text('View Full Size'))
                  ],
                ),
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => showFullIInfo(
              context: context, title: 'Vision', content: 'This is Content'),
          child: Container(
            height: _pagesize.height * 0.3,
            width: _pagesize.width * 0.4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Our Vision'),
                        ElevatedButton(
                            onPressed: () => showFullIInfo(
                                context: context,
                                title: 'Vision',
                                content: 'This is Content'),
                            child: Text('View Full Size'))
                      ],
                    ),
                    color: Colors.transparent)),
          ),
        ),
      ],
    );
  }
}
