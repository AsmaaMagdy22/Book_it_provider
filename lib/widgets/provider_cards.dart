import 'package:book_it_provider/ui/apptheme.dart';
import 'package:book_it_provider/widgets/provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    itemCount: activities.length,
                    itemBuilder: (BuildContext context, int index) {
//                      ProviderActivity activity = activities[index];
                      return Container(
                        height: 90,
                        child: InkWell(
                          onTap: (){},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,

                                          children: <Widget>[
                                            Padding(padding:  EdgeInsets.only(top: 5),),
                                            Text(
                                              'مستشفى',
                                              style: TextStyle(
                                                fontFamily: 'font1',
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(
                                              'السعودى الألمانى',
                                              style: TextStyle(
                                                  fontFamily: 'font1',
                                                  fontSize: 15,
                                                  color: Colors.black),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(
                                              '4.7/5',
                                              style: TextStyle(
                                                  fontFamily: 'font1',
                                                  fontSize: 10,
                                                  color: Colors.black),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                      )),
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundColor: grey1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 6.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color:  darkBlue,
                                  blurRadius:18,
                                  offset: Offset(0, 4),
                                  spreadRadius: -15
                              )
                            ]
                        ),
                      );
                    }),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16)),
        ],
      ),
    );
  }
}

//Widget _listBuilder(BuildContext context, int index) {
//  return Card(
//    child: Column(
//      children: <Widget>[
//        Text(activities[index].email),
//        Container(
//            child: Text(activities[index].mobile)
//        )
//      ],
//    ),
//  );
//}
