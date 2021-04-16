import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/features/login/model/login_view_model.dart';
import 'package:wallet/features/registration/ui/register_feature_widget.dart';

class LoginScreen extends Screen {
  final LoginViewModel viewModel;
  final Function onTapSubmit;
  final Function onIdInputChange;
  final Function onPasswordInputChange;

  LoginScreen({
    this.onIdInputChange,
    this.onPasswordInputChange,
    this.onTapSubmit,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {



    return LoginForm(viewModel,onTapSubmit,onIdInputChange,
        this.onPasswordInputChange);
  }
}

class LoginForm extends StatefulWidget {
  final LoginViewModel viewModel;
  final Function onTapSubmit;
  final Function onIdInputChange;
  final Function onPasswordInputChange;

  LoginForm(this.viewModel, this.onTapSubmit, this.onIdInputChange,
      this.onPasswordInputChange);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel= widget.viewModel;
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallet App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: media.height * 0.1,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: ValueKey('user_id'),
                      validator: (value) {
                        return viewModel.uiLoginCredentialDto.isIdFieldEmpty();
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration('user ID'),
                      onChanged: widget.onIdInputChange,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: ValueKey('password'),
                      validator: (value) {
                        return viewModel.uiLoginCredentialDto
                            .isPasswordFieldEmpty();
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: buildInputDecoration('password'),
                      onChanged: widget.onPasswordInputChange,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: 400,
                      height: 45,
                      key: Key('login_button_key'),
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                         // _formKey.currentState.save();
                          widget.onTapSubmit('');
                        }

                        //
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible:
                          widget.viewModel.serviceStatus == LoginServiceStatus.fail,
                      child: Text(
                        "Cannot connect to server",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'New to Wallet ?',
                              style: TextStyle(
                                color: Color(0xFF424242),
                                letterSpacing: 0.4,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Signing up takes less than a minute',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: MaterialButton(
                              color: Colors.white,
                              textColor: Colors.black,
                              minWidth: 40,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(
                                    color: Colors.blue,
                                  )),
                              height: 45,
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        RegisterFeatureWidget()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  InputDecoration buildInputDecoration(String hints) {
    return InputDecoration(
      hintText: hints,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      //contentPadding: EdgeInsets.all(16),
      /*labelStyle: TextStyle(
        color: this._hasEmailError(viewModel) ? Colors.red : Colors.black,
      ),
      hintStyle: TextStyle(
        color: this._hasEmailError(viewModel) ? Colors.red : Colors.black,
      ),*/
      //enabledBorder: this._renderBorder(viewModel),
      // focusedBorder: this._renderBorder(viewModel),
    );
  }
}
