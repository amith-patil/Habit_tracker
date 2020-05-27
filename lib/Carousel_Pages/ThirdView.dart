import 'dart:ui';

import 'package:flutter/material.dart';

import '../Size_Config.dart';
import '../main.dart';

class ThirdView extends StatefulWidget {
  final Data data;

  ThirdView({this.data});

  @override
  _ThirdViewState createState() => _ThirdViewState();
}

class _ThirdViewState extends State<ThirdView> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Var3",
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    //height: Size_Config.blockSizeVertical * 30,
                    width: Size_Config.screenWidth,
                    child: Container(//color:Colors.redAccent,
                        alignment: Alignment.center
                        ,child: Text('Afternoon Habits',style: TextStyle(fontFamily: 'Pacifico',fontSize: Size_Config.blockSizeHorizontal * 10, color: Colors.white),)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemCount: widget.data.listItems.length,
                    itemBuilder: (BuildContext context,int index){
                      final item = widget.data.listItems[index];
                      return Dismissible(
                        key: Key(item),
                        background: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.check_circle,
                              size: 45,
                              color: Colors.white,
                            )),
                        secondaryBackground: Container(
                            padding: EdgeInsets.only(right: 15),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.cancel,
                              size: 45,
                              color: Colors.white,
                            )),
                        onDismissed: (direction) {
                          setState(() {
                            widget.data.listItems.removeAt(index);
                            widget.data.listSubtitles.removeAt(index);
                            widget.data.listIcons.removeAt(index);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(10),
                            child: new ListTile(
                              title: Text(widget.data.listItems[index],style: TextStyle(fontFamily: 'Montserrat',fontSize: Size_Config.blockSizeHorizontal * 5,fontWeight: FontWeight.bold),),
                              subtitle: Text(widget.data.listSubtitles[index],style: TextStyle(fontFamily: 'Montserrat',fontSize: Size_Config.blockSizeHorizontal * 3,color: Colors.grey[900]),),
                              leading: Icon(widget.data.listIcons[index],size: Size_Config.blockSizeVertical * 5,color: Colors.cyan,),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 100 * 3,
              left: MediaQuery.of(context).size.width / 100 * 5,
              child: Material(
                shape: CircleBorder(),
                //borderRadius: BorderRadius.circular(15),
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
