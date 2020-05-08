import 'package:avatar_glow/avatar_glow.dart';
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
    print(_width /2);
    //PageController _pgc1 = CarouselDemo.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: _height,
            width: _width,
            color: Colors.grey[100],
          ),
          Container(
            height: _height * 0.3,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TweenAnimationBuilder(
                  duration: Duration(seconds: 2),
                  tween: Tween<double>(begin: 0.1,end: 1),
                  curve: Curves.elasticOut,
                  builder: (context,value,child){
                    return Transform.scale(scale: value,child: AvatarGlow(
                      glowColor: Colors.redAccent,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 3),
                      duration: Duration(seconds: 3),
                      endRadius: 90,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(60),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/amith-patil/business_card/master/images/joel_signature.gif'),
                          radius: 60,
                        ),
                      ),
                    ),);
                  },
                ),
              ],
            ),
          ),
        ],),
    );
  }
}
