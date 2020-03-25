import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Customers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomersStatue();
  }
}

class CustomersStatue extends State<Customers> {

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

  List users;
  @override
  void initState() {
    super.initState();
    users = new List();
    setState(() {
      users.add('محمد غانم');
      users.add('صلاح رشاد');
      users.add('أحمد المحلاوى');
      users.add('أسماء مجدى');

    });

  }

  @override
  void dispose() {
    super.dispose();
    //Cancel listening
    //_onOkSubscription.cancel();
    //_onDeleteSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Color(0xff333E4A),
        title: Text("كشري الونش",
            style: TextStyle(
              fontFamily: 'font',
              fontWeight: FontWeight.bold,
              color: Color(0xff35D7F1),
              fontSize: 16.0,
            )),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top:16,bottom:8),
              child: Text(' عدد الزيارات ${users.length}',textDirection: TextDirection.rtl,style: TextStyle(
                fontSize: 16,fontFamily: 'font',color:Colors.grey
              ),),
            ),
            Expanded(
              child: new ListView.builder(

                  itemCount: users.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, position) {
                    int pos = position + 1;
                    return new Container(
                      child: new Slidable(

                        delegate: new SlidableBehindDelegate(),
                        actionExtentRatio: 0.20,
                        child: new Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          margin: EdgeInsets.all(5),
                          elevation: 15,
                          child: ExpansionTile(
                            title:  Text('${users[position]}',textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 14,fontFamily: 'font',color:Colors.blueGrey),),
                            trailing: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff333E4A),
                              child:  Text('$pos'),
                            ),
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text('مدة الخدمة ',style: TextStyle(
                                          fontSize: 12,fontFamily: 'font',color:Colors.blueGrey,
                                        ),),
                                        Text(
                                          '00:30',
                                          style: TextStyle(
                                              fontSize: 24, color: Color(0xff35D7F1)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                        ),
                                        Text('وقت الانتظار',style: TextStyle(
                                            fontSize: 12,fontFamily: 'font',color:Colors.blueGrey,
                                        ),),
                                        Text(
                                          '00:45',
                                          style: TextStyle(
                                              fontSize: 24, color: Color(0xff35D7F1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height:120,
                                        child: ClipRRect(
                                          child: Image.asset('images/ahmed.jpg'),
                                          borderRadius: BorderRadius.circular(60),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new RaisedButton(
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.white70,
                                            ),
                                            shape: new CircleBorder(),
                                          ),
                                          new RaisedButton(
                                            child: Icon(
                                              Icons.chat,
                                              color: Colors.white70,
                                            ),
                                            shape: new CircleBorder(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        actions: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 30,
                          child: IconButton(icon: Icon(Icons.close,size:30,color: Color(0xff35D7F1),), onPressed: (){}),
                          ),

                        ],
                        secondaryActions: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xff333E4A),
                            radius: 30,
                            child: IconButton(icon: Icon(Icons.check_circle_outline,size:30,color: Color(0xff35D7F1),), onPressed: (){}),
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xff35D7F1),
                            radius: 30,
                            child: IconButton(icon: Icon(Icons.mode_edit,size:30,color: Color(0xff333E4A),), onPressed: (){}),
                          ),
                        ],
                      ),

                    );
                  }),
            ),
          ],
        ),
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
