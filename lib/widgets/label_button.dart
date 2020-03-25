import 'package:book_it_provider/ui/apptheme.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {

  final String name ;
  final Object onTap;
  final Color color ;
  final Color color2 ;
  final Color color3 ;
  final Image image;

  const LabelButton({Key key, this.name,this.onTap,this.color,this.image,@required this.color3,this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(


      onTap: onTap,

      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(name,style: TextStyle(fontFamily: 'font1',fontSize: 15,color: color2)),

            CircleAvatar(child: image,
              radius: 25,
              backgroundColor: grey1,
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
