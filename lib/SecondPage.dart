import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Size_Config.dart';
import 'main.dart';

class SecondPage extends StatefulWidget {
  final Data data;

  const SecondPage({Key key, this.data}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final myControllerItem = TextEditingController();
  final myControllerSubtitle = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerItem.dispose();
    myControllerSubtitle.dispose();
    super.dispose();
  }

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
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 10,
                        child: Image.asset(
                          'images/habit_bg.png',
                        ))
                  ],
                ),
                Expanded(
                  child: Container(
                    //color: Colors.blueGrey,
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width /
                                      100 *
                                      5),
                              child: Text(
                                'New Habit!',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 100 * 5,
                          ),
                          //alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                controller: myControllerItem,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter a habit!',
                                    hintStyle: TextStyle(color: Colors.grey)),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 30,
                                ),
                              ),
                              TextField(
                                controller: myControllerSubtitle,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter a subtitle!',
                                    hintStyle: TextStyle(color: Colors.grey)),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Lets start with a new habit!',
                                style: TextStyle(fontFamily: 'Montserrat',
                                color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
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
    );
  }
}
