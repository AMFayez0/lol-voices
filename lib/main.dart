
import 'package:flutter/material.dart';

import 'package:lol/layouts/home.dart';

void main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'leguea of legends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
