import 'package:book_it_provider/service/auth_service.dart';
import 'package:book_it_provider/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/widgets/circular_button.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/ui/apptheme.dart';
import 'package:google_sign_in/google_sign_in.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GoogleSignIn _googlSignIn = new GoogleSignIn();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
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
                            Text('تسجيل الدخول',
                                style: TextStyle(
                                    fontSize: 24, fontFamily: 'font1'))
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CustomTextFormField(
                              directionality: TextDirection.rtl,
                              controller: emailController,
                              hintName: 'الايميل',
                              color: offWhite,
                              secure: false,
                              color3: darkBlue,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                            CustomTextFormField(
                              directionality: TextDirection.rtl,
                              controller: passwordController,
                              hintName: 'كلمة المرور',
                              color: offWhite,
                              secure: true,
                              color3: darkBlue,
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              change: (val) {
                                setState(() => email = val);
                              },
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircularButton(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/HomePage');
                                      },
                                      color3: darkBlue,
                                      color: darkBlue,
                                      image: Image.asset('images/google.png'),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    CircularButton(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/HomePage');
                                      },
                                      color3: grey1,
                                      color: darkBlue,
                                      image: Image.asset(
                                        'images/f_white.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomButton(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/ForgotPassword');
                                  },
                                  name: ('نسيت كلمة المرور ؟'),
                                  color: Colors.transparent,
                                  color3: Colors.transparent,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12))
                          ],
                        )),
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
                                    dynamic result = await _auth
                                        .signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Please supply a valid email';
                                      });
                                    }
                                  }
                                },
                                name: 'الدخول',
                                color: awesome,
                                color3: darkBlue,
                              ),
                              CustomButton(
                                name: 'انشاء حساب جديد',
                                onTap: () => widget.toggleView(),
                                color: grey1,
                                color3: darkBlue,
                                color2: darkBlue,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ));
  }
}
