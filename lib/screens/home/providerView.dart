import 'dart:io';
import 'package:book_it_provider/screens/home/providerEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProviderViewState();
  }
}

class ProviderViewState extends State<ProviderView> {
  int _selectedIndex2 ;
  void _onItemTapped(int index2) {
    setState(() {
      _selectedIndex2 = index2;
    });
    if(_selectedIndex2==2){
      Navigator.of(context).pushNamed('/Settings');
    }else if(_selectedIndex2 == 0){
      Navigator.of(context);

    }else{
      Navigator.of(context);
    }
  }
  String _businessName = "الونش";
  File _image;
  String _catalog = "مطعم";
  String _owner = "أ/ محمود الونش";
  String _description ="أفضل مطعم لإعداد الوجبات السريعة";
  String _rating ="⭐⭐⭐⭐⭐";
  String _address="الحي السابع - مدينة نصر";
  String _email="Elwinsh@service.com";
  String _mobile="+20123547895";
  String _website="facebook.com/ELWINSH";
  List _workDays;
  List _holidays;
  String _from="07:00";
  String _to="16:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                backgroundColor: Color(0xff333E4A),
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("$_businessName",
                      style: TextStyle(
                        fontFamily: 'font',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff35D7F1),
                        fontSize: 16,
                      )),
                  background: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      _image == null
                          ? Image.asset(
                              'images/default_cover.png',
                              height: 250,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            )
                          : Image.file(
                              _image,
                              height: 250,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.only(top:5 ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        InkWell(
                          child: CircleAvatar(
                            backgroundImage: ExactAssetImage(
                              'images/momo.jpg',
                            ),
                            minRadius: 25,
                            maxRadius: 35,
                          ),
                          onTap: (){showDialog<String>(

                              context: context,
                              builder: (BuildContext context)=> SimpleDialog(
                                children: <Widget>[
                                  new Container(
                                      child: Image.asset('images/component.png'),

                                  ),

                                ],
                              )

                          );},
                        ),

                        SizedBox(
                          width: 20,
                        ),

                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          '$_catalog لصاحبه $_owner',
                          style: TextStyle(
                              fontSize: 16,

                              fontFamily: 'font',

                          ),
                          maxLines: 2,
                        )
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: 20)),

                    Text('$_description',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'font',
                      ),),
                    Text('$_rating',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'font',
                      ),),


                    Card(
                      margin: EdgeInsets.only(top:60),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.location_on,color: Color(0xff35D7F1)),
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Expanded(
                                child: Text(
                                  '$_address',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'font',
                                  ),
                                  textDirection: TextDirection.rtl,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Card(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.alternate_email,color: Color(0xff35D7F1)),
                            Expanded(
                                child: Text(
                                  '$_email',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'font',
                                  ),
                                  textDirection: TextDirection.rtl,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Card(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone_iphone,color: Color(0xff35D7F1)),
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Expanded(
                                child: Text(
                                  '$_mobile',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'font',
                                  ),
                                  textDirection: TextDirection.rtl,
                                ))
                          ],
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: 10)),
                    Card(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search,color: Color(0xff35D7F1)),
                            Expanded(
                                child: Text(
                                  '$_website',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'font',
                                  ),
                                  textDirection: TextDirection.rtl,
                                ))
                          ],
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: 60),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Column(children: <Widget>[
                          Text('أيام العمل',
                            style: TextStyle(
                              fontFamily: 'font',
                          ),
                          ),

                          Card(
                            color: Color(0xff333E4A),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Wrap(spacing: 20,
                                    children: <Widget>[
                                      Text('س',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                      Text('ح',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                      Text('ن',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                      Text('ث',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                      Text('ر',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                      Text('خ',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                    ],)

                                ],
                              ),
                            ),
                          ),
                        ],),

                        Column(children: <Widget>[
                          Text('أيام الاجازة',
                            style: TextStyle(
                            fontFamily: 'font',
                            ),
                          ),

                          Card(
                            color: Color(0xff333E4A),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Wrap(spacing: 20,
                                    children: <Widget>[
                                      Text('ج',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                                    ],)

                                ],
                              ),
                            ),
                          ),

                        ],)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text('ساعات العمل',style: TextStyle(fontFamily: 'font',),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('من',style: TextStyle(fontSize: 18,fontFamily: 'font',),),

                          Card(
                            color: Color(0xff333E4A),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Text('$_from',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),)
                                  ],)

                                ],
                              ),
                            ),
                          ),



                        Text('إلي',style: TextStyle(fontSize: 18,fontFamily: 'font',),),
                        Card(
                          color: Color(0xff333E4A),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                  Text('$_to',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'font',),),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),





                  ],

                ),

              )
            ],
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProviderEdit(),
              )
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Color(0xff35D7F1),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline,size: 30,),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 30),
            title: SizedBox.shrink(),
          ),
        ],
        currentIndex: 1,
        selectedItemColor:Color(0xff35D7F1) ,
        onTap: _onItemTapped,
      ),
    );
  }
}
