import 'package:book_it_provider/viewmodels/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  String _ownerName = "محمد الونش";


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
    viewModel: HomeViewModel(),
    onModelReady: (model) => model.listenToPosts(),
    builder: (context, model, child) => Scaffold(
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
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("$_ownerName",
                      style: TextStyle(
                        fontFamily: 'font',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff35D7F1),
                        fontSize: 16.0,
                      )),
                  background: CircleAvatar(
                    backgroundImage: ExactAssetImage(
                      'images/momo.jpg',
                    ),
                    minRadius: 25,
                    maxRadius: 40,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(50)),
                Text(
                  'قائمة النشاطات',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'font',
                      color: Color(0xff333E4A),
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Expanded(
                  child: model.posts != null
                      ? ListView.builder(
                      itemCount: model.posts.length,
                      itemBuilder: (context, index) {
                        return new Container(
                          child: new Slidable(
                            delegate: new SlidableBehindDelegate(),
                            actionExtentRatio: 0.9,
                            child: new Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              margin: EdgeInsets.all(5),
                              elevation: 15,
                              child: ExpansionTile(
                                title: Text(
                                  '${model.posts[index].name }',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'font',
                                      color: Colors.blueGrey),
                                ),
                                trailing: CircleAvatar(
                                  backgroundImage: ExactAssetImage(
                                    'images/default_image.png',
                                  ),
                                  minRadius: 30,
                                  maxRadius: 30,
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.settings),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: () => model.editPost(index),
                                            child: Text(
                                              'عن النشاط',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'font',
                                              ),
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Icon(Icons.view_week),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: model.navigateToCustomerseView,
                                            child: Text(
                                              'طابور الخدمة',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'font',
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 30,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Color(0xff35D7F1),
                                    ),
                                    onPressed: () => model.deletePost(index),
                              ),
                              )  ],
                          ),
                        );
                      })
                      : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  )
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 30,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            title: SizedBox.shrink(),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color(0xff35D7F1),
        onTap: _onItemTapped,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: model.navigateToCreateView,
        child: Icon(Icons.add),
        backgroundColor: Color(0xff35D7F1),
      ),
    ));
  }
}
