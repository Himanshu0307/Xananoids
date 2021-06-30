import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gh/fonts/social_icon_icons.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart' as cloud;

class Squadw extends StatefulWidget {
  @override
  _SquadwState createState() => _SquadwState();
}

class _SquadwState extends State<Squadw> with SingleTickerProviderStateMixin {
  //static variable
  var firedata = FirebaseFirestore.instance.collection('Squad');
  List<Map<String, Object>> _name = [];
  int i = 0;

  // user defined Functions

  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override

  //Function to show Modal Sheet
  // ignore: override_on_non_overriding_member
  void modalsheetopen(
      BuildContext ctx, Map<String, Object> data, Size _pagesize) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) {
          return SafeArea(
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(data['URL']),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ClipRRect(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        margin: EdgeInsets.only(top: 10),
                        color: Colors.white70,
                        width: _pagesize.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(data['Year']),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 15,
                              children: [
                                ...((data['Field'] as List<dynamic>).map(
                                    (_name) =>
                                        Text('\u2022' + _name.toString()))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          if (await canLaunch(data['InstaUrl']))
                                            launch(data['InstaUrl']);
                                        },
                                        icon: Icon(SocialIcon.instagram)),
                                    IconButton(
                                        onPressed: () async {
                                          if (await canLaunch(data['InstaUrl']))
                                            launch(data['LinkedUrl']);
                                        },
                                        icon:
                                            Icon(SocialIcon.linkedin_circled)),
                                    IconButton(
                                        onPressed: () async {
                                          if (await canLaunch(data['InstaUrl']))
                                            launch(data['GitUrl']);
                                        },
                                        icon: Icon(SocialIcon.github_circled))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: firedata.get(),
        builder: (ctx, data) {
          if (data.connectionState == ConnectionState.done) {
            var _data = data.data as QuerySnapshot<Map<String, dynamic>>;
            _data.docs.forEach((element) {
              print(element.id);
              print(element.data());
              _name.add({
                'Name': element.id,
                'Year': element.data()['Year'],
                'URL': element.data()['URL'],
                'Field': element.data()['Field']
              });
            });
            return Stack(
              children: [
                Image.asset(
                  'lib/assets/network.gif',
                  fit: BoxFit.fill,
                  height: pagesize.height,
                  width: pagesize.width,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () => modalsheetopen(ctx, _name[index], pagesize),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: pagesize.height * 0.35,
                      child: SizedBox(
                        height: pagesize.height * 0.2,
                        width: pagesize.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                  _name[index]['URL'],
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Card(
                                borderOnForeground: true,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(3),
                                  minVerticalPadding: 4,
                                  title: Text(
                                    _name[index]['Name'],
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                  subtitle: Text(_name[index]['Year'],
                                      style: TextStyle(color: Colors.brown)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: _name.length,
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
