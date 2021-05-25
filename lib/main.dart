import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screen/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialise = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Hack the World', home: MyHomePage());
  }
}
