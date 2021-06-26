import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CuroselImageView extends StatelessWidget {
  final List _url;
  CuroselImageView(this._url);
  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, item, page) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Card(
              elevation: 6,
              child: Image.network(_url[item], fit: BoxFit.fill,
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
    );
  }
}
