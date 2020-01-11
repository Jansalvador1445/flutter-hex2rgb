import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _hexInput = "";
  String _rgbInput = "";
  double _screenWidth;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width / 8;
    return Scaffold(
      // backgroundColor: Color(0xff000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: _screenWidth, right: _screenWidth),
              child: Column(
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Color(0xffffffff)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Hex',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
