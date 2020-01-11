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
  double _screenWidth;
  int _backgroundColor = 0xFFffffff;

  void _onConvert(String value) {
    setState(() {
      _backgroundColorConverter(value);
    });
  }

  _backgroundColorConverter(String _hexColor) {
    _hexColor = _hexColor.replaceAll("#", "");

    if (_hexColor.length < 6) _hexColor += "ffffff";

    _backgroundColor = int.parse("0xFF$_hexColor");
    return _backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width / 8;
    return Scaffold(
      backgroundColor: new Color(_backgroundColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: _screenWidth, right: _screenWidth),
              child: Column(
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: Color(0xffffffff),
                        ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Hex',
                    ),
                    onChanged: _onConvert,
                  ),
                  Text("Ex. 34495e or #34495e"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
