import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouseldemo/FirstView.dart';
import 'package:carouseldemo/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:carouseldemo/custom_icons_icons.dart';

import 'SecondPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  PanelController _pc = new PanelController();
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SlidingUpPanel(
        controller: _pc,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        minHeight: _height * 0.07,
        maxHeight: _height -83,
        parallaxEnabled: true,
        parallaxOffset: 0.2,
        defaultPanelState: PanelState.OPEN,
        collapsed: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25) ),
              color: Colors.white
          ),
          //color: Colors.white,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40,top: 10,right: 190,left: 190),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red, Colors.purple])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 190,horizontal: 20),
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 170,
                fontFamily: 'Pacifico',
                color: Colors.black26
              ),
            ),
          ),
        ),
        panel: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: Container(
            alignment: Alignment.center,
            height: _height,
            width: _width,
            color: Colors.grey[100],
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  height: _height,
                  width: _width * 0.2,
                  color: Colors.grey[200],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 125, left: 10),
                                child: Text(
                                  'Hi Amith!',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontFamily: 'Pacifico',
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[

                              Padding(
                                padding:
                                const EdgeInsets.only(top: 35,right: 20),
                                child: IconButton(
                                  icon: Icon(CustomIcons.plus),
                                  color: Colors.grey,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage() ));
                                  },
                                  //iconSize: 25,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 55,right: 20),
                                child: IconButton(
                                  onPressed: () => _pc.close(),
                                  icon: Icon(CustomIcons.filter),
                                  color: Colors.grey,
                                  //iconSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                    CarouselSlider(
                        options: CarouselOptions(
                          height: _height * 0.67,
                          aspectRatio: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.8,
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50 ),
                            child: Hero(
                              tag: "Var1",
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FirstView()));
                                },
                                child: Material(
                                  elevation: 15,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: _width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage('https://i.pinimg.com/originals/65/f5/6e/65f56efd2a0a3144424b4f47a39cd54f.jpg'),
                                          fit: BoxFit.cover
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Material(
                              elevation: 15,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: _width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                    image: DecorationImage(
                                      image: NetworkImage('https://www.itl.cat/pngfile/big/30-302874_hd-cover-dark-forest-wallpapers-high-quality-wallpapers.jpg'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Material(
                              elevation: 15,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: _width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                    image: DecorationImage(
                                        image: NetworkImage('https://wallpaperplay.com/walls/full/d/a/5/30774.jpg'),
                                        fit: BoxFit.cover
                                    )),
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(CustomIcons.bar_chart),
                  //iconSize: 40,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: _width * 0.5,
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(CustomIcons.user),
                 // iconSize: 40,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(CustomIcons.plus,size: 20,),
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
