import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:wallet/login/model/login_view_model.dart';

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
    final _formKey = GlobalKey<FormState>();
    final media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Wallet App"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height *0.1,
              ),
              TextFormField(
                key: ValueKey('user_id'),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
                decoration: buildInputDecoration('user ID'),
                onChanged: onIdInputChange,
              ),
              SizedBox(
                height:15,
              ),
          TextFormField(
            key: ValueKey('password'),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.visiblePassword,
            decoration: buildInputDecoration('password'),
            onChanged: onPasswordInputChange,
          ),
              SizedBox(
                height:20,
              ),
              MaterialButton(
                minWidth: 400,
                height: 45,
                key: Key('login_button_key'),
                color: Colors.lightBlue,
                onPressed: () {
                  onTapSubmit('');
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        )));
  }

  InputDecoration buildInputDecoration(String hints ) {
    return InputDecoration(
                hintText: hints,
                hintStyle: TextStyle(fontSize: 16),
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
              );
  }



}
