import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {

  final Object onTap;
  final String name;
  final Color color ;
  final Color color3 ;


  const CategoryButton({Key key, this.onTap,this.name,this.color3,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(

        child:Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            color: color,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,textDirection: TextDirection.rtl,
                softWrap: true,style: TextStyle(
                    fontFamily: 'font1',color: Colors.black
                ),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
//            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: color3,

                  blurRadius:25,
                  offset: Offset(0, 4),
                  spreadRadius: -15
              )
            ]
        ),

      ),
    );
  }
}
