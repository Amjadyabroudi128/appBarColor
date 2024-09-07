import 'package:appbarclr/colorList.dart';
import 'package:appbarclr/constants.dart';
import 'package:appbarclr/textColor.dart';
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
  @override
  Widget build(BuildContext context) {
    String selectClr = "select colors";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
        appBarTheme: AppBarTheme(
          color: appBar,
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(selectClr, style: TextStyle(color: getTextColor(_appBarColor)), // Dynamically set text color
          ),
          backgroundColor: _appBarColor,
          actions: <Widget>[
            PopupMenuButton<Color>(
              elevation: 8,
              position: PopupMenuPosition.over,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(14)
                )
              ),
              onSelected: (Color color) {
                setState(() {
                  _appBarColor = color;
                });
              },
              icon: popmenu,
              itemBuilder: (BuildContext context) {
                return colorNames.keys.map((Color color) {
                  return PopupMenuItem<Color>(
                    value: color,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: color,
                        ),
                        width10,
                        Text(colorNames[color]!),
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
            style: centre
          ),
        ),
      ),
    );
  }
}
