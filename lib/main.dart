import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/pager_indicator.dart';
import './pages.dart';
import './page_reveal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Page Reveal',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Page(
            viewModel: pages[0],
            percentVisible: 0.5,
          ),
          new PageReveal(
            revealPersent: 1,
            child: new Page(
              viewModel: pages[1],
              percentVisible: 0.5,
            ),
          ),
          new PageIndicator(
            
          ),
        ],
      ),
    );
  }
}
