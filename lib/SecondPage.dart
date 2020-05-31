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
  bool monVal = false;
  bool tueVal = false;
  bool wedVal = false;
  bool thuVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;
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
        resizeToAvoidBottomPadding: false,
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
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex:6,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    children: <Widget>[
                      TextField(
                        controller: myControllerItem,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a new Habit!',
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrat'
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrat'
                        ),
                      ),
                      TextField(
                        controller: myControllerSubtitle,
                        maxLength: 30,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a description!',
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat'
                        ),
                      ),
                      SizedBox(
                        height: Size_Config.blockSizeVertical * 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Mon',
                                style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: monVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      monVal ? monVal = false : monVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Tue' ,style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: tueVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      tueVal ? tueVal = false : tueVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Wed',style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: wedVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      wedVal ? wedVal = false : wedVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Thu',style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: thuVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      thuVal ? thuVal = false : thuVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Fri',style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: friVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      friVal ? friVal = false : friVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Sat',style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: satVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      satVal ? satVal = false : satVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Sun',style: TextStyle(fontFamily: 'Montserrat'),),
                                Checkbox(
                                  value: sunVal,
                                  onChanged: (bool value){
                                    setState(() {
                                      sunVal ? sunVal = false : sunVal = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: Size_Config.blockSizeVertical * 20,
                      ),
                      //TODO: add icon picker
                      RaisedButton(
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Create Habit!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        onPressed: () { Navigator.pop(context); },

                      )
                    ],
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
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
