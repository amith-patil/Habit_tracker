import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouseldemo/FirstView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SecondPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(CarouselDemo());
}

class CarouselDemo extends StatefulWidget {
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: frontpage(),
    );
  }
}

class frontpage extends StatefulWidget {
  @override
  _frontpageState createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: _width,
                height: _height,
                color: Colors.cyan,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:125,left: 15),
                          child: Text(
                            'Hi Amith!',
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Pacifico',
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 5),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.black,
                            iconSize: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 5),
                          child: IconButton(
                            icon: Icon(Icons.sort),
                            color: Colors.black,
                            iconSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  child: Container(
                    height: _height,
                    color: Colors.grey[100],
                    child: CarouselSlider(
                        options: CarouselOptions(
                          //height: 600.0,
                          aspectRatio: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                        ),
                        items: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              width: _width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.yellow
                              ),
                              child: Container(
                                height: _height * 0.4,
                                width: _width * 0.6,
                                //color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Try Something\n new today',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'if you do something consistently for 21 days, it becomes a habit! Are you ready to start a new habit?',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                          Hero(
                            tag: "Var1",
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FirstView()));
                              },
                              child: Container(
                                width: _width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            width: _width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                          ),
                          Container(
                            width: _width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  iconSize: 40,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add Habit'),
        heroTag: "demoTag",
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
