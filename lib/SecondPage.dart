import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Size_Config.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "demoTag",
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
            ),
            Positioned(
              top: Size_Config.blockSizeVertical * 5,
              left: Size_Config.blockSizeHorizontal* 2,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                iconSize: Size_Config.blockSizeVertical * 4,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}