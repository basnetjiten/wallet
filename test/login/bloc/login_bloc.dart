import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/login/bloc/login_bloc.dart';
import 'package:wallet/features/login/model/login_view_model.dart';

import 'login_bloc_mock.dart';


void main() {
  LoginBloc _loginBloc;
  LoginBlocBlocMock loginBlocBlocMock;
  RepositoryScope _scope;
  setUp((){
    _loginBloc = LoginBloc();
    loginBlocBlocMock = LoginBlocBlocMock();
  });

  test('LoginBloc gets view model, mock', () {

    loginBlocBlocMock.loginViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<LoginViewModel>());
      expect(model.uiLoginCredentialDto.id, 'id');
      expect(model.uiLoginCredentialDto.password, 'password');
    }));
  });
  //this would fail for real data
  test('LoginBloc gets view model, real', () {

    //expectAsync1 takes on argument
    _loginBloc.loginViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<LoginViewModel>());
      expect(model.uiLoginCredentialDto.id, 'Test');
      expect(model.uiLoginCredentialDto.password, 'password');
    }));
  });
}
