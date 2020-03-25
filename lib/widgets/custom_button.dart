import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {

  final String name ;
  final Function onTap;
  final Color color ;
  final Color color2 ;
  final Color color3 ;



  const CustomButton({Key key, this.name,this.onTap,this.color,this.color2,
    @required this.color3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),


      onTap: onTap,

      child: Container(
        height: 50,
        child: Center(
          child: Text(name,style: TextStyle(fontSize: 15,fontFamily: 'font1',color: color2),),
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color:  color3,
                  blurRadius:30,
                  offset: Offset(0, 4),
                  spreadRadius: -15
              )
            ]
        ),

      ),
    );
  }
}
