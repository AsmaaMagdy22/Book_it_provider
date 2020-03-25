import 'package:book_it_provider/service/auth_service.dart';
import 'package:book_it_provider/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/ui/apptheme.dart';

class EmailRegister extends StatefulWidget {
  final Function toggleView;
  EmailRegister({this.toggleView});

  @override
  _EmailRegisterState createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
            padding: EdgeInsets.only(right: 32, left: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ClipRRect(
                          child: Image.asset(
                            'images/logo2.png',
                            fit: BoxFit.fill,
                            height: 150,
                            width: 150,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        Text(
                          'انشاء حساب جديد',
                          style: TextStyle(fontSize: 24, fontFamily: 'font1'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomTextFormField(
                            hintName: 'الاسم',
                            directionality: TextDirection.rtl,
                            secure: false,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            change: (val) {
                              setState(() => name = val);
                            },
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          CustomTextFormField(
                            hintName: 'الايميل',
                            directionality: TextDirection.rtl,
                            secure: false,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            change: (val) {
                              setState(() => email = val);
                            },
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          CustomTextFormField(
                            hintName: 'كلمة المرور',
                            directionality: TextDirection.rtl,
                            secure: true,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            change: (val) {
                              setState(() => password = val);
                            },
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomButton(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'Could not sign in with those credentials';
                                  });
                                }
                              }
                            },
                            color: awesome,
                            color3: darkBlue,
                            name: 'انشاء',
                          ),
                          CustomButton(
                            onTap: () {
                              Navigator.of(context).pushNamed('/LoginPage');
                            },
                            name: 'لدى حساب',
                            color: grey1,
                            color3: darkBlue,
                            color2: darkBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
  }
}
