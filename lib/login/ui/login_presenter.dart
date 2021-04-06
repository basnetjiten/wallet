import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wallet/login/bloc/login_bloc.dart';
import 'package:wallet/login/model/dto/login_credential_dto.dart';
import 'package:wallet/login/model/login_view_model.dart';
import 'package:wallet/login/ui/login_screen.dart';


class LoginPresenter extends Presenter<LoginBloc, LoginViewModel, LoginScreen> {
  final UiLoginCredentialDto loginCredDto;

  LoginPresenter({this.loginCredDto});

  @override
  LoginScreen buildScreen(
      BuildContext context, LoginBloc bloc, LoginViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == LoginServiceStatus.initial) {
        print('init');
      }
      if (viewModel.serviceStatus == LoginServiceStatus.processing) {
        print('processing');
      }

      print(viewModel.serviceStatus.toString());
      if (viewModel.serviceStatus == LoginServiceStatus.success) {
        print(viewModel.loginResponseModel.toString());
        _showUserDetailsDialog(
            context, viewModel.loginResponseModel.toString());

        return;
      } else if (viewModel.serviceStatus == LoginServiceStatus.fail) {
        _showUserDetailsDialog(context, "Login Status Failed");
      } else if (viewModel.serviceStatus == LoginServiceStatus.unknown) {
        _showUserDetailsDialog(context, "Login Status Unknown");
      }
    });
    return LoginScreen(
        viewModel: viewModel,
        onPasswordInputChange: (password) {
          _onChangePassword(bloc, password);
        },
        onIdInputChange: (userId) {
          _onChangeUserId(bloc, userId);
        },
        onTapSubmit: (value) {
          bloc.submitPipe.launch();
        });
  }

  void _onChangePassword(LoginBloc bloc, String password) {
    debugPrint(password);
    loginCredDto.password = password;
    bloc.uiLoginCredPipe.send(loginCredDto);
  }

  void _onChangeUserId(LoginBloc bloc, String userId) {
    debugPrint(userId);
    loginCredDto.id = userId;
    bloc.uiLoginCredPipe.send(loginCredDto);
  }

  @override
  Stream<LoginViewModel> getViewModelStream(LoginBloc bloc) {
    return bloc.loginViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _showUserDetailsDialog(BuildContext context, String data) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Login Success'),
        content: Text(data),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              //CFRouterScope.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
