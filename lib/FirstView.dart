import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Var1",
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.pinimg.com/originals/65/f5/6e/65f56efd2a0a3144424b4f47a39cd54f.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear),
              iconSize: 50,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}