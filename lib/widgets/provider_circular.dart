import 'package:flutter/material.dart';

class ProviderCircular extends StatelessWidget {

  final Object onTap;
  final Color color ;
  final Color color3 ;
  final IconButton icon ;


  const ProviderCircular({Key key, this.onTap,this.color,@ required this.color3,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 40,
        child:CircleAvatar(child: icon,
          radius: 20,
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
