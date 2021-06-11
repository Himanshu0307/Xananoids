import 'package:flutter/material.dart';

class ListForDetails extends StatelessWidget {
  final Size pagesize;
  ListForDetails(this.pagesize);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: pagesize.height,
      width: pagesize.width,
      child: ListView.builder(
        itemBuilder: (ctx, i) => Card(
          elevation: 5,
          child: Container(
            // foregroundDecoration:
            // BoxDecoration(backgroundBlendMode: BlendMode.softLight),
            height: pagesize.height * 0.8,
            width: pagesize.width,
            child: GridTile(
              child: Container(),
              header: SizedBox(
                height: pagesize.height * 0.1,
                width: pagesize.width,
                child: GridTileBar(
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.report)),
                  title: Text(
                    'Title : Title$i',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('Postid : #post$i',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              footer: SizedBox(
                  height: pagesize.height * 0.6,
                  width: pagesize.width,
                  child: Text('This is a post shared by Admin')),
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
