import 'package:book_it_provider/viewmodels/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_it_provider/widgets/custom_button.dart';
import 'package:book_it_provider/widgets/custom_textfield.dart';
import 'package:book_it_provider/ui/apptheme.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class EmailRegister extends StatelessWidget {
  final Function toggleView;
  EmailRegister({this.toggleView});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return  ViewModelProvider<SignUpViewModel>.withConsumer(
    viewModel: SignUpViewModel(),
    builder: (context, model, child) => Scaffold(
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
    controller: fullNameController,

    directionality: TextDirection.rtl,
                            secure: false,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,

                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          CustomTextFormField(
                            hintName: 'الايميل',
    controller: emailController,

    directionality: TextDirection.rtl,
                            secure: false,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,

                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          CustomTextFormField(
                            hintName: 'كلمة المرور',
    controller: passwordController,
                            directionality: TextDirection.rtl,
                            secure: true,
                            color3: darkBlue,
                            color: offWhite,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,

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
                            onTap: () {
    model.signUp(
    email: emailController.text,
    password: passwordController.text,
    fullName: fullNameController.text);
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
          )));
  }
}
