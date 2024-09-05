import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _appBarColor = Colors.blue;

  final Map<Color, String> _colorNames = {
    Colors.red: "Red",
    Colors.green: "Green",
    Colors.blue: "Blue",
    Colors.orange: "Orange",
    Colors.purple: "Purple",
    Colors.yellow: "Yellow",
    Colors.pink: "Pink",
    Colors.teal: "Teal",
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Select colors "),
          backgroundColor: _appBarColor,
          actions: <Widget>[
            PopupMenuButton<Color>(
              onSelected: (Color color) {
                setState(() {
                  _appBarColor = color;
                });
              },
              icon: Icon(Icons.arrow_downward, color: Colors.black,),
              itemBuilder: (BuildContext context) {
                return _colorNames.keys.map((Color color) {
                  return PopupMenuItem<Color>(
                    value: color,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: color,
                        ),
                        SizedBox(width: 10),
                        Text(_colorNames[color]!),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
           "select colors for AppBar",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
