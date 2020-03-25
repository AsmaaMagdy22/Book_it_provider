import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool status = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 12),
              child: Center(child: Text('الاعدادات',style: TextStyle(fontSize: 18,fontFamily: 'font'),),),
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color:  Color(0xff333E4A),
                        blurRadius:45,
                        offset: Offset(0, 4),
                        spreadRadius: -15
                    )
                  ]
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    CustomSwitch(
                      activeColor:Color(0xff35D7F1),
                      value: status,
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    Text('الوضع المظلم', style: TextStyle(
                      fontFamily: 'font',
                        color: Colors.black,
                        fontSize: 16
                    ),textDirection: TextDirection.rtl,)
                  ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomSwitch(
                        activeColor:Color(0xff35D7F1),
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                      Text('الاشعارات', style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.black,
                          fontSize: 16
                      ),textDirection: TextDirection.rtl,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomSwitch(
                        activeColor:Color(0xff35D7F1),
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                      Text('العربية', style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.black,
                          fontSize: 16
                      ),textDirection: TextDirection.rtl,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('عن التطبيق', style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.black,
                          fontSize: 16
                      ),textDirection: TextDirection.rtl,)
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),

    );
  }
}