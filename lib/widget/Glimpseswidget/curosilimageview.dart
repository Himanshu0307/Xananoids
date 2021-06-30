import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CuroselImageView extends StatefulWidget {
  final List _url;

  CuroselImageView(this._url);

  @override
  _CuroselImageViewState createState() => _CuroselImageViewState();
}

class _CuroselImageViewState extends State<CuroselImageView> {
  int album = 0;

  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: album == 0
                    ? null
                    : () {
                        setState(() {
                          album = 0;
                        });
                      },
                child: Text('Achievements'),
              ),
              ElevatedButton(
                  onPressed: album == 1
                      ? null
                      : () {
                          setState(() {
                            album = 1;
                          });
                        },
                  child: Text('Glimpses')),
              ElevatedButton(
                  onPressed: album == 2
                      ? null
                      : () {
                          setState(() {
                            album = 2;
                          });
                        },
                  child: Text('Events')),
              ElevatedButton(
                  onPressed: album == 3
                      ? null
                      : () {
                          setState(() {
                            album = 3;
                          });
                        },
                  child: Text('Projects'))
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: CarouselSlider.builder(
              itemCount: widget._url[album]['URL'].length,
              itemBuilder: (BuildContext context, item, page) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Card(
                    elevation: 6,
                    child: Image.network(widget._url[album]['URL'][item],
                        fit: BoxFit.fill,
                        loadingBuilder: (ctx, child, loading) {
                      if (loading == null) return child;
                      return Center(child: CircularProgressIndicator());
                    }),
                  ),
                );
              },
              options: CarouselOptions(
                height: pagesize.height * 0.6,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
