import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:wallet/features/login/bloc/login_bloc.dart';
import 'package:wallet/features/login/model/dto/login_credential_dto.dart';
import 'package:wallet/features/login/ui/login_presenter.dart';
class LoginFeatureWidget extends StatefulWidget {
  @override
  _LoginFeatureWidgetState createState() => _LoginFeatureWidgetState();
}

class _LoginFeatureWidgetState extends State<LoginFeatureWidget> {

UiLoginCredentialDto _uiLoginCredentialDto;
@override
  void initState() {
    _uiLoginCredentialDto= UiLoginCredentialDto(id: '',password: '');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
          body: LoginPresenter(loginCredDto:_uiLoginCredentialDto)),
    );
  }
}
