import 'package:avatar_glow/avatar_glow.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouseldemo/FirstView.dart';
import 'package:carouseldemo/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:carouseldemo/custom_icons_icons.dart';

import 'Profile.dart';
import 'SecondPage.dart';
import 'Stats.dart';

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
  PageController _pgc = new PageController(initialPage: 0);
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      print(index);
      _pgc.animateToPage(_currentIndex, duration: Duration (milliseconds: 300), curve: Curves.easeInOut);

    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pgc,
        children: <Widget>[
          SlidingUpPanel(
            controller: _pc,
            //backdropEnabled: true,
            //backdropColor: Colors.black,
            //backdropOpacity: 0.8,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            minHeight: _height * 0.07,
            maxHeight: _height / 1.12,
            parallaxEnabled: true,
            parallaxOffset: 0.2,
            defaultPanelState: PanelState.OPEN,
            collapsed: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Colors.white),
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 6,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red, Colors.purple])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 190, horizontal: 20),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: 170,
                          fontFamily: 'Pacifico',
                          color: Colors.black26),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 105,
                  right: _width / 2 - 25,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _pc.open();
                      });
                    },
                  ),
                )
              ],
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
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: IconButton(
                                            icon: Icon(CustomIcons.plus),
                                            color: Colors.grey,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SecondPage()));
                                            },
                                            //iconSize: 25,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: SizedBox()),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                            onPressed: () => _pc.close(),
                                            icon: Icon(CustomIcons.filter),
                                            color: Colors.grey,
                                            //iconSize: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CarouselSlider(
                              options: CarouselOptions(
                                height: _height,
                                aspectRatio: 1,
                                initialPage: 1,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                  padding: EdgeInsets.only(bottom: 50,top: 40),
                                  child: Hero(
                                    tag: "Var1",
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FirstView()));
                                      },
                                      child: Material(
                                        elevation: 15,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              width: _width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.red,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://i.pinimg.com/originals/65/f5/6e/65f56efd2a0a3144424b4f47a39cd54f.jpg'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Positioned(left: 20,bottom: 30,child: Text('Do Anytime', style: TextStyle(fontFamily: 'Montserrat',fontSize: 40,color: Colors.white),))
                                          ],
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: Material(
                                    elevation: 15,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: _width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Colors.blue,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://electricvehicles.in/wp-content/uploads/2018/07/bike-images-4.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Positioned(left: 20,bottom: 30,child: Text('Morning', style: TextStyle(fontFamily: 'Montserrat',fontSize: 40,color: Colors.white),))

                                      ],
                                    )
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: Material(
                                    elevation: 15,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: _width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Colors.green,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://blog.hdwallsource.com/wp-content/uploads/2016/02/gloomy-forest-bridge-wallpaper-49801-51479-hd-wallpapers.jpg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(left: 20,bottom: 30,child: Text('Afternoon', style: TextStyle(fontFamily: 'Montserrat',fontSize: 40,color: Colors.white),))

                                      ],
                                    )
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 50),
                                  child: Material(
                                      elevation: 15,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            width: _width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.green,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://i.pinimg.com/originals/66/55/03/6655039bd090abed0037746c6edf662b.jpg'),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(left: 20,bottom: 30,child: Text('Evening', style: TextStyle(fontFamily: 'Montserrat',fontSize: 40,color: Colors.white),))

                                        ],
                                      )
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 125,
                      left: 15,
                      child: Text(
                        'Hi Amith!',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Pacifico',
                            color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      left: 1,
                      child: TweenAnimationBuilder(
                        duration: Duration(seconds: 2),
                        tween: Tween<double>(begin: 0.1,end: 1),
                        curve: Curves.elasticOut,
                        builder: (context,value,child){
                          return Transform.scale(scale: value,child: AvatarGlow(
                            glowColor: Colors.redAccent,
                            repeat: true,
                            repeatPauseDuration: Duration(seconds: 3),
                            duration: Duration(seconds: 3),
                            endRadius: 70,
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(40),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/amith-patil/business_card/master/images/joel_signature.gif'),
                                radius: 40,
                              ),
                            ),
                          ),);
                        },
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stats(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                CustomIcons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                CustomIcons.home,
                color: Colors.red,
              ),
              title: Text("Home",style: TextStyle(fontFamily: 'Montserrat'),)),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                CustomIcons.bar_chart,
                color: Colors.black,
              ),
              activeIcon: Icon(
                CustomIcons.bar_chart,
                color: Colors.deepPurple,
              ),
              title: Text("Stats",style: TextStyle(fontFamily: 'Montserrat'))),
          BubbleBottomBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(
                CustomIcons.user,
                color: Colors.black,
              ),
              activeIcon: Icon(
                CustomIcons.user,
                color: Colors.purple,
              ),
              title: Text("Profile",style: TextStyle(fontFamily: 'Montserrat'))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CustomIcons.plus,
          size: 20,
        ),
        heroTag: "demoTag",
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
