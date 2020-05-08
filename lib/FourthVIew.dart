import 'dart:ui';

import 'package:carouseldemo/Size_Config.dart';
import 'package:flutter/material.dart';

class FourthView extends StatefulWidget {
  @override
  _FourthViewState createState() => _FourthViewState();
}

class _FourthViewState extends State<FourthView> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Var4",
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image4.jpg'),fit: BoxFit.cover
                  )
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 100 * 3,
              left: MediaQuery.of(context).size.width / 100 * 5,
              child: Material(
                shape: CircleBorder(),
                elevation: 10,

                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: Size_Config.blockSizeHorizontal * 7,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
