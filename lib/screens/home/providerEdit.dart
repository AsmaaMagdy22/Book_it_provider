import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:Provider/screens/home/mainUi.dart';

int _selectedIndex;

class ProviderEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProviderEditState();
  }
}

class ProviderEditState extends State<ProviderEdit> {



  List<String> _days = ['ج', 'خ', 'ع', 'ث', 'ن', ' ح', 'س'];
  File _image;
  String _businessName = "إسم النشاط";
  TextEditingController businessNameController = new TextEditingController();
  String _dropValue = 'صالون حلاقة';
  String _day = '';
  TimeOfDay _time = TimeOfDay.now();
  String _pickedTime1 = '';
  String _pickedTime2 = '';

  Widget _buildDay(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          setDay(index);
        });
      },
      child: Container(
        child: CircleAvatar(
          backgroundColor:
              _selectedIndex == index ? Color(0xff35D7F1) : Colors.transparent,
          child: Text(_days[index],
              textDirection: TextDirection.rtl,
              softWrap: true,
              style: TextStyle(
              fontFamily: 'font',
              color: Colors.white,
                fontSize: 16,
              )),
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
              color: Color(0xff333E4A),
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: -34)
        ]),
      ),
    );
  }

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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'font',
                      color: Color(0xff35D7F1),
                      fontSize: 16.0,
                    )),
                background: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    _image == null
                        ? Image.asset(
                            'images/component.png',
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
                    Positioned(
                      bottom: -6,
                      child: Opacity(
                        opacity: 0.5,
                        child: RaisedButton(
                          onPressed: () => addPhoto(),
                          child: _image == null
                              ? Text(
                                  'اضافة صورة',
                                  style: TextStyle(
                                      color: Color(0xff333E4A),
                                      fontFamily: 'font'),
                                )
                              : Text(
                                  'تغيير الصورة',
                                  style: TextStyle(
                                      color: Color(0xff333E4A),
                                      fontFamily: 'font'),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              children: <Widget>[
                new Text(
                  '      فئة النشاط',
                  style: TextStyle(
                      fontSize: 14, color: Colors.blueGrey, fontFamily: 'font'),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: DropdownButton<String>(
                      items: <String>[
                        'عيادة',
                        'مطعم',
                        ' جراج',
                        'صالون حلاقة',
                        'سنتر',
                        'قاعة مناسبات'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontFamily: 'font', color: Colors.blueGrey),
                          ),
                        );
                      }).toList(),
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          _dropValue = newValue;
                        });
                      },
                      value: _dropValue,
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.blueGrey,
                      ),
                      isExpanded: true,
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                      //controller: ,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'مالك النشاط',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontFamily: 'font',
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                      onChanged: (_) {
                        setState(() {
                          _businessName = businessNameController.text;
                        });
                      },
                      controller: businessNameController,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'إسم النشاط',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontFamily: 'font',
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                      //controller: ,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'عن المكان',
                        labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontFamily: 'font'),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                      //controller: ,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'الموقع الجغرافى',
                        labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontFamily: 'font'),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      //controller: ,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'الهاتف',
                        labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontFamily: 'font'),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      //controller: ,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35D7F1)),
                        ),
                        labelText: 'موقع الانترنت',
                        labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontFamily: 'font'),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Center(
                      child: Text(
                    'أيام العمل',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'font',
                    ),
                  )),
                ),
                Container(
                  height: 40,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: _days
                        .asMap()
                        .entries
                        .map(
                          (MapEntry map) => _buildDay(map.key),
                        )
                        .toList(),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff333E4A),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 12,
                            offset: Offset(0, 8),
                            spreadRadius: -30)
                      ]),
                ),
                Padding(padding: EdgeInsets.all(20)),
                new Text(
                  ' ساعات العمل $_day',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontFamily: 'font',
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'من ',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontFamily: 'font'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          onPressed: () => selectTime1(context),
                          child: Text(
                            '$_pickedTime1',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xff333E4A),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      new Text(
                        'الى ',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontFamily: 'font'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          onPressed: () => selectTime2(context),
                          child: Text(
                            '$_pickedTime2',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xff333E4A),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(30)),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {if(businessNameController.text!=null){
                    setState(() {
                      //users.add('${businessNameController.text}');
                    });
                  }
                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/MainUi');
                    },
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          'حفظ',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'font',
                              color: Colors.blueGrey),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff35D7F1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff333E4A),
                                blurRadius: 30,
                                offset: Offset(0, 4),
                                spreadRadius: -15)
                          ]),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),

//      bottomNavigationBar: BottomNavigationBar(
//
//        items: const <BottomNavigationBarItem>[
//
//          BottomNavigationBarItem(
//            icon: Icon(Icons.chat_bubble_outline,size: 30,),
//            title: SizedBox.shrink(),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home,size: 30),
//            title: SizedBox.shrink(),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings,size: 30),
//            title: SizedBox.shrink(),
//          ),
//        ],
//        currentIndex: 1,
//        selectedItemColor:Color(0xff35D7F1) ,
//        onTap: (_){},
//      ),
    );
  }

  Future addPhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  setDay(int value) {
    setState(() {
      {
        if (_selectedIndex == 0) {
          _day = 'يوم الجمعة';
        }
        if (_selectedIndex == 1) {
          _day = 'يوم الخميس';
        }
        if (_selectedIndex == 2) {
          _day = 'يوم الاربعاء';
        }
        if (_selectedIndex == 3) {
          _day = 'يوم الثلاثاء';
        }
        if (_selectedIndex == 4) {
          _day = 'يوم الاثنين';
        }
        if (_selectedIndex == 5) {
          _day = 'يوم الأحد';
        }
        if (_selectedIndex == 6) {
          _day = 'يوم السبت';
        }
      }
    });
  }

  Future<Null> selectTime1(BuildContext context) async {
    _time = await showTimePicker(context: context, initialTime: _time);
    setState(() {
      _pickedTime1 = '${_time.hour}:${_time.minute}';
    });
  }

  Future<Null> selectTime2(BuildContext context) async {
    _time = await showTimePicker(context: context, initialTime: _time);
    setState(() {
      _pickedTime2 = '${_time.hour}:${_time.minute}';
    });
  }
}
