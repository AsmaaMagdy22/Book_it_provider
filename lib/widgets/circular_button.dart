import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {

  final Object onTap;
  final Image image;
  final Color color ;
  final Color color3 ;
  final IconButton icon ;


  const CircularButton({Key key, this.onTap,this.image,this.color,@ required this.color3,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 50,
        child:CircleAvatar(child: image,
          radius: 25,
          backgroundColor: Colors.white,
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
