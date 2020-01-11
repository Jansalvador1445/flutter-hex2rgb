import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo : HEX-2-RGB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
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
  String _rgbString = "RBG(255,255,255)";

  void _onConvert(String value) {
    setState(() {
      _backgroundColorConverter(value);
    });
  }

  _backgroundColorConverter(String _hexColor) {
    _hexColor = _hexColor.replaceAll("#", "");

    if (_hexColor.length < 6) _hexColor += "ffffff";

    _backgroundColor = int.parse("0xFF$_hexColor");

    //Convert Hex to RGB
    var red = int.parse(_hexColor.substring(0, 2), radix: 16);
    var blue = int.parse(_hexColor.substring(2, 4), radix: 16);
    var green = int.parse(_hexColor.substring(4, 6), radix: 16);

    _rgbString = "RGB($red,$blue,$green)";

    return _backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width / 8;
    return Scaffold(
      backgroundColor: new Color(_backgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              _rgbString,
              style: TextStyle(fontSize: 30),
            ),
            padding: EdgeInsets.all(50),
          ),
          Container(
            margin: EdgeInsets.only(
              left: _screenWidth,
              right: _screenWidth,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // color: Color(0xffffffff),
                      ),
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: 'Hex',
                  ),
                  onChanged: _onConvert,
                ),
                Padding(
                  child: Text("Ex. 34495e or #34495e"),
                  padding: EdgeInsets.all(20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
