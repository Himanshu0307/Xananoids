import 'package:flutter/material.dart';

class CardProject extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  CardProject({this.imageUrl, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 5,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  imageUrl,
                  loadingBuilder: (ctx, child, loading) {
                    if (loading == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: GridTileBar(
                    title: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(description),
                  ))
            ],
          ),
        ));
  }
}
