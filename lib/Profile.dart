import 'package:avatar_glow/avatar_glow.dart';
import 'package:carouseldemo/Size_Config.dart';
import 'package:carouseldemo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SecondPage.dart';
import 'custom_icons_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    //PageController _pgc1 = CarouselDemo.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: _height,
            width: _width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/imagebg.png'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
          ),
        ),
          ),
          Container(
            height: Size_Config.blockSizeVertical *100,
            color: Colors.transparent,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
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
                            endRadius: Size_Config.blockSizeHorizontal * 22,
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(Size_Config.blockSizeHorizontal * 15),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/amith-patil/business_card/master/images/joel_signature.gif'),
                                radius: Size_Config.blockSizeHorizontal * 15,
                              ),
                            ),
                          ),);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Amith Patil',
                    style: TextStyle(
                      fontSize: Size_Config.blockSizeHorizontal * 12,
                      fontFamily: 'Pacifico'
                    ),)
                  ],
                )
              ],
            ),
          ),
        ],),
    );
  }
}
