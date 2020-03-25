import 'package:flutter/material.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/ui/apptheme.dart';


TextEditingController changedPasswordController = new TextEditingController();
TextEditingController samePasswordController = new TextEditingController();

String changedPassword;
String samePassword;

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                  child:Text('اكتب كلمة المرور الجديدة',style: TextStyle(fontSize: 24,fontFamily: 'font1'),)
                  ,
                )
            ),
            Expanded(
              flex: 1,
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      hintName: 'كلمة المرور',
                      controller: changedPasswordController,
                      secure: true,
                      color: offWhite,
                      color3: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),

                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      hintName: 'تأكيد كلمة المرور',
                      controller: samePasswordController,
                      secure: true,
                      color: offWhite,
                      color3: darkBlue,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomButton(
                      onTap: (){
                        setState(() {
                          changedPassword = changedPasswordController.text;
                          samePassword = samePasswordController.text;
                        });
                        Navigator.of(context).pushNamed('/HomePage');


                      } ,
                      color: darkBlue,
                      name: 'المتابعة',
                      color3: darkBlue,
                      color2: Colors.white,

                    ),

                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 32),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
