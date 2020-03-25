import 'package:flutter/material.dart';

class ProviderLabel extends StatelessWidget {

  final String name ;
  final Object onTap;
  final Color color ;
  final Color color2 ;
  final Color color3 ;
  final IconButton iconButton;

  const ProviderLabel({Key key, this.name,this.onTap,this.color,this.iconButton,@required this.color3,this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(


      onTap: onTap,

      child: Container(
        height: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(child: Text(name,style: TextStyle(fontFamily: 'font1',fontSize: 12,color: color2),maxLines: 2,)),

            CircleAvatar(child: iconButton,
              radius: 19,
              backgroundColor: Colors.transparent,
            )
          ],
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
