import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/login/bloc/login_bloc.dart';
import 'package:wallet/login/model/dto/login_credential_dto.dart';
import 'package:wallet/login/model/login_view_model.dart';


class LoginBlocBlocMock extends Fake implements LoginBloc {
  final loginViewModelPipe = Pipe<LoginViewModel>();
final uiLoginCredentialDto = UiLoginCredentialDto(title: "title", id: "id", password: "password");
  LoginBlocBlocMock() {
    loginViewModelPipe.whenListenedDo(() {
      loginViewModelPipe.send(LoginViewModel(
          uiLoginCredentialDto: uiLoginCredentialDto));
    });
  }

  @override
  void dispose() {}
}
