import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/ui/apptheme.dart';

TextEditingController restoreEmailController = new TextEditingController();

String restoreEmail;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(right: 32,left: 32),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                  child:Text('نسيت كلمة المرور؟',style: TextStyle(fontSize: 24,fontFamily: 'font1'),)
                  ,
                )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      controller: restoreEmailController,
                      hintName: 'الايميل',
                      secure: false,
                      color: offWhite,
                      color3: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomButton(
                      onTap: (){
                        setState(() {
                          restoreEmail = restoreEmailController.text;
                        });
                        Navigator.of(context).pushNamed('/Confirmation');

                      } ,
                      name: 'متابعة',
                      color: darkBlue,
                      color2: Colors.white,
                      color3: darkBlue,


                    ),

                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomButton(
                      onTap: (){
                        Navigator.of(context).pushNamed('/LoginPage');
                      } ,
                      name: 'الرجوع <<',
                      color3: Colors.transparent,

                    ),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
