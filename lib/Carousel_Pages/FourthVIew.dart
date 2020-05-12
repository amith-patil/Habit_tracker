import 'dart:ui';

import 'package:carouseldemo/Size_Config.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FourthView extends StatefulWidget {
  final Data data;
  FourthView({this.data});

  @override
  _FourthViewState createState() => _FourthViewState();
}

class _FourthViewState extends State<FourthView> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Var4",
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image4.jpg'),fit: BoxFit.cover
                  )
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    //height: Size_Config.blockSizeVertical * 30,
                    width: Size_Config.screenWidth,
                    child: Material(
                      elevation: 10,
                      color: Colors.transparent,
                      child: Container(color:Colors.redAccent,
                        alignment: Alignment.center
                        ,child: Text('Evening Habits',style: TextStyle(fontFamily: 'Pacifico',fontSize: Size_Config.blockSizeHorizontal * 10, color: Colors.white),)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: widget.data.listItems.length,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: new ListTile(
                            title: Text(widget.data.listItems[index],style: TextStyle(fontFamily: 'Montserrat',fontSize: 25,fontWeight: FontWeight.bold),),
                            subtitle: Text(widget.data.listSubtitles[index]),
                            leading: Icon(widget.data.listIcons[index]),
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
