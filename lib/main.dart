import 'package:avatar_glow/avatar_glow.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouseldemo/Carousel_Pages/FirstView.dart';
import 'package:carouseldemo/Carousel_Pages/SecondView.dart';
import 'package:carouseldemo/Carousel_Pages/ThirdView.dart';
import 'package:carouseldemo/Carousel_Pages/FourthVIew.dart';
import 'package:carouseldemo/Size_Config.dart';
import 'package:carouseldemo/custom_icons_icons.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'FadeIn.dart';
import 'Profile.dart';
import 'SecondPage.dart';
import 'Stats.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
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
  void initState() {
    // adjust the provider based on the image type
    precacheImage(new AssetImage('images/image1.gif'), context);
    precacheImage(new AssetImage('images/image1.jpg'), context);
    precacheImage(new AssetImage('images/image2.jpg'), context);
    precacheImage(new AssetImage('images/image3.jpg'), context);
    precacheImage(new AssetImage('images/image4.jpg'), context);
    super.initState();
  }

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
  bool isClosed = false;
  bool firstTime = true;
  DateTime _startDate = DateTime.parse('2020-05-01 00:00:00Z');
  DateTime _selectedDate = DateTime.now();
  PanelController _pc = new PanelController();
  DatePickerController _dpc = new DatePickerController();
  PageController _pgc = new PageController(initialPage: 0);

  final data1 = Data(
    listItems: ["Call Sid",],
    listSubtitles: [" Dont forget to call Sid",],
    listIcons: [Icons.phone,]);

  final data2 = Data(
      listItems: ["Brush teeth","workout","take shower",],
      listSubtitles: [" brush teeth twice a day","workout for an hour"," take shower at 11:00 AM",],
      listIcons: [Icons.brush,Icons.gamepad,Icons.slow_motion_video,]);

  final data3 = Data(
      listItems: ["eat lunch","Post Lunch walk"],
      listSubtitles: [" eat a well balanced meal", "Go for a nice walk"],
      listIcons: [Icons.fastfood,Icons.directions_walk]);

  final data4 = Data(
      listItems: ["Read a book","go to bed",],
      listSubtitles: ["Read atleast 15 pages", "go to bed at 11:00 PM"],
      listIcons: [Icons.book,Icons.alarm]);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    Size_Config().init(context);
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pgc,
        children: <Widget>[
          SlidingUpPanel(
            controller: _pc,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            minHeight: Size_Config.blockSizeVertical * 50,
            maxHeight: Size_Config.blockSizeVertical * 65,
            // parallaxEnabled: true,
            // parallaxOffset: 0.2,
            defaultPanelState: PanelState.OPEN,
            isDraggable: false,

            body: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  width: Size_Config.screenWidth,
                  height: Size_Config.screenHeight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/imagebg.png'),
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.1), BlendMode.dstATop),
                          fit: BoxFit.cover),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red, Colors.purple])),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: Size_Config.blockSizeVertical * 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: Size_Config.blockSizeHorizontal * 20),
                        child: DatePicker(
                          _startDate,
                          controller: _dpc,
                          initialSelectedDate: _selectedDate,
                          width: Size_Config.blockSizeHorizontal * 15,
                          height: Size_Config.blockSizeVertical * 12,
                          monthTextStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white54,
                              fontSize: Size_Config.blockSizeHorizontal * 3),
                          dateTextStyle: TextStyle(
                              fontFamily: 'MontSerrat',
                              fontSize: Size_Config.blockSizeHorizontal * 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                          dayTextStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white54,
                              fontSize: Size_Config.blockSizeHorizontal * 3),
                          onDateChange: (date) {
                            //TODO : redraw carousel on date change
                            _pc.open();
                            isClosed = !isClosed;
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Size_Config.screenHeight,
                  width: Size_Config.blockSizeHorizontal * 20,
                  color: Colors.black12,
                ),
                Container(
                  height: Size_Config.blockSizeVertical * 25,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Spacer(),
                        Expanded(
                          flex: 8,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(CustomIcons.plus),
                                  color: Colors.white54,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 600),
                                            pageBuilder: (_, __, ___) =>
                                                SecondPage()));
                                  },
                                  //iconSize: 25,
                                ),
                              ),
                              //Expanded(flex: 1, child: SizedBox()),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    isClosed ? _pc.open() : _pc.close();
                                    isClosed = !isClosed;
                                    print(isClosed);
                                    //Jugaaad in code format
                                    if(firstTime){
                                      _dpc.animateToDate(DateTime.now().add(Duration(days: -1)));
                                      firstTime = false;
                                      print(firstTime);
                                    }
                                    else
                                    _dpc.animateToSelection();
                                  },
                                  icon: Icon(CustomIcons.filter),
                                  color: Colors.white54,
                                  //iconSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Positioned(
                    top: Size_Config.blockSizeVertical * 15,
                    left: Size_Config.blockSizeHorizontal * 10,
                    child: FadeIn(
                      1.66,
                      Text(
                        'Hi Amith!',
                        style: TextStyle(
                            fontSize: Size_Config.blockSizeHorizontal * 9,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    width: Size_Config.screenWidth,
                    child: FadeIn(
                      1,
                      GestureDetector(
                        onTap: () {
                          _pgc.jumpToPage(2);
                        },
                        child: TweenAnimationBuilder(
                          duration: Duration(seconds: 3),
                          tween: Tween<double>(begin: 0.1, end: 1),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: AvatarGlow(
                                glowColor: Colors.white,
                                repeat: true,
                                repeatPauseDuration: Duration(seconds: 3),
                                duration: Duration(seconds: 3),
                                endRadius: Size_Config.blockSizeHorizontal * 15,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(
                                      Size_Config.blockSizeHorizontal * 7),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/image1.gif'),
                                    radius: Size_Config.blockSizeHorizontal * 7,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )),
              ],
            ),
            panel: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Container(
                alignment: Alignment.center,
                height: Size_Config.screenHeight,
                width: Size_Config.screenWidth,
                //color: Colors.grey[100],
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/imagebg.png'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.1), BlendMode.dstATop),
                    ),
                    color: Colors.grey[100]),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: FadeIn(
                              2.33,
                              CarouselSlider(
                                  options: CarouselOptions(
                                    height: Size_Config.screenHeight,
                                    //aspectRatio: 16/9,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.7,
                                    enlargeCenterPage: true,
                                  ),
                                  items: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        width: Size_Config.screenWidth,
                                        child: Container(
                                          height: Size_Config.screenHeight,
                                          width:
                                              Size_Config.blockSizeHorizontal *
                                                  60,
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
                                                'Try Something new today!',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: Size_Config
                                                            .blockSizeHorizontal *
                                                        10),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                _selectedDate.day.toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: Size_Config
                                                            .blockSizeHorizontal *
                                                        5),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Size_Config.blockSizeVertical * 5,
                                          top: Size_Config.blockSizeVertical *
                                              5),
                                      child: Hero(
                                        tag: "Var1",
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pageBuilder: (_, __, ___) =>
                                                        FirstView(data: data1)));
                                          },
                                          child: Material(
                                              elevation: 10,
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        Size_Config.screenWidth,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: Colors.red,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/image1.jpg'),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      left: 20,
                                                      bottom: 30,
                                                      child: Text(
                                                        'Do Anytime',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: Size_Config
                                                                    .blockSizeHorizontal *
                                                                8,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Size_Config.blockSizeVertical * 5,
                                          top: Size_Config.blockSizeVertical *
                                              5),
                                      child: Hero(
                                        tag: "Var2",
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pageBuilder: (_, __, ___) =>
                                                        SecondView(data: data2)));
                                          },
                                          child: Material(
                                              color: Colors.transparent,
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        Size_Config.screenWidth,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: Colors.blue,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/image2.jpg'),
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  Positioned(
                                                      left: 20,
                                                      bottom: 30,
                                                      child: Text(
                                                        'Morning',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: Size_Config
                                                                    .blockSizeHorizontal *
                                                                10,
                                                            color:
                                                                Colors.white),
                                                      ))
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Size_Config.blockSizeVertical * 5,
                                          top: Size_Config.blockSizeVertical *
                                              5),
                                      child: Hero(
                                        tag: "Var3",
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pageBuilder: (_, __, ___) =>
                                                        ThirdView(data: data3)));
                                          },
                                          child: Material(
                                              elevation: 10,
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        Size_Config.screenWidth,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: Colors.green,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/image3.jpg'),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  Positioned(
                                                      left: 20,
                                                      bottom: 30,
                                                      child: Text(
                                                        'Afternoon',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: Size_Config
                                                                    .blockSizeHorizontal *
                                                                10,
                                                            color:
                                                                Colors.white),
                                                      ))
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Size_Config.blockSizeVertical * 5,
                                          top: Size_Config.blockSizeVertical *
                                              5),
                                      child: Hero(
                                        tag: "Var4",
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pageBuilder: (_, __, ___) =>
                                                        FourthView(data: data4)));
                                          },
                                          child: Material(
                                              elevation: 10,
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        Size_Config.screenWidth,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: Colors.green,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/image4.jpg'),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  Positioned(
                                                      left: 20,
                                                      bottom: 30,
                                                      child: Text(
                                                        'Evening',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: Size_Config
                                                                    .blockSizeHorizontal *
                                                                10,
                                                            color:
                                                                Colors.white),
                                                      ))
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ]),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 15,
        //notchMargin: 15,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home),
                color: Colors.redAccent,
                //visualDensity: VisualDensity.adaptivePlatformDensity,
                iconSize: 45,
                onPressed: (){
                  setState(() {
                    _pgc.jumpToPage(0);
                  });
                },
              ),
            ),
            Spacer(),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person),
                color: Colors.redAccent,
                iconSize: 45,
                onPressed: (){
                  setState(() {
                    _pgc.jumpToPage(1);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        label: Text('New Habit'),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 600),
                  pageBuilder: (_, __, ___) => SecondPage()));
        },
        heroTag: "demoTag",
      ),
    );
  }
}


class Data {
  List<String> listItems;
  List<String> listSubtitles;
  List<IconData> listIcons;

  Data({this.listItems, this.listSubtitles,this.listIcons});
}
