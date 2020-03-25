import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/screens/login/forgot_password.dart';
import 'package:book_it_provider/ui/apptheme.dart';

TextEditingController codeController = new TextEditingController();

String code;

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(right: 32,left: 32,),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('اكتب كود تأكيد الحساب',style: TextStyle(fontSize: 24,fontFamily: 'font1')),
                      Text('تم ارسال كود التأكيد الى الحساب '
                          '\n         ${restoreEmailController.text}',style: TextStyle(fontSize: 18,fontFamily: 'font1'),)
                    ],
                  ),
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
                      hintName: 'كود التأكيد',
                      controller: codeController,
                      secure: false,
                      color: offWhite,
                      color3: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomButton(
                      onTap: (){
                        setState(() {
                          code = codeController.text;
                        });
                        Navigator.of(context).pushNamed('/NewPassword');
                      } ,
                      color: darkBlue,
                      color3: darkBlue,
                      color2: Colors.white,
                      name: 'تأكيد',
                    ),

                  ],
                ),
              ),

            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CustomButton(
                        onTap: (){
                          Navigator.of(context).pushNamed('/ForgotPassword');
                        } ,
                        name: 'الرجوع <<',
                        color3: Colors.transparent,

                      ),
                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
