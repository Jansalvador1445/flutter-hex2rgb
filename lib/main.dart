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
  Color _inputColor = Color.fromRGBO(0, 0, 0, 1.0);

  void _onConvert(String value) {
    setState(() {
      _backgroundColorConverter(value);
    });
  }

  _backgroundColorConverter(String _hexColor) {
    _hexColor = _hexColor.replaceAll("#", "");

    if (_hexColor.length < 6) {
      _hexColor += "ffffff";
      _inputColor = Color.fromRGBO(0, 0, 0, 1.0);
    }

    _backgroundColor = int.parse("0xFF$_hexColor");

    //Convert Hex to RGB
    var _red = int.parse(_hexColor.substring(0, 2), radix: 16);
    var _blue = int.parse(_hexColor.substring(2, 4), radix: 16);
    var _green = int.parse(_hexColor.substring(4, 6), radix: 16);

    _rgbString = "RGB($_red,$_blue,$_green)";

    //Foreground Color
    _inputColor = Color.fromRGBO((_red - 50), (_blue - 50), (_green - 50), 1.0);

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
              style: TextStyle(
                fontSize: 30,
                color: _inputColor,
              ),
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
                    color: _inputColor,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: _inputColor,
                    )),
                    hintText: 'Hex',
                  ),
                  onChanged: _onConvert,
                  maxLength: 7,
                ),
                Padding(
                  child: Text(
                    "Ex. 34495e or #34495e",
                    style: TextStyle(
                      color: _inputColor,
                    ),
                  ),
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
