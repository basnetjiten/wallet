import 'package:clean_framework/clean_framework.dart';
import 'package:wallet/login/api/login_service.dart';
import 'package:wallet/login/bloc/login_usecase.dart';
import 'package:wallet/login/model/dto/login_credential_dto.dart';
import 'package:wallet/login/model/login_view_model.dart';

class LoginBloc extends Bloc {
  LoginUseCase _loginUseCase;

  final loginViewModelPipe = Pipe<LoginViewModel>();
  final uiLoginCredPipe = Pipe<UiLoginCredentialDto>();

  final submitPipe = EventPipe();

  LoginBloc() {
    _loginUseCase =
        LoginUseCase((viewModel) => loginViewModelPipe.send(viewModel));
    loginViewModelPipe.whenListenedDo(() {
      _loginUseCase.create();
    });
    uiLoginCredPipe.receive.listen(loginInputHandler);
    submitPipe.listen(submitHandler);
  }



  void loginInputHandler(UiLoginCredentialDto uiLoginCredentialDto) {
    _loginUseCase.updateLoginCred(uiLoginCredentialDto);
  }



  void submitHandler() {
    _loginUseCase.submit();
  }

  @override
  void dispose() {
    loginViewModelPipe.dispose();
   uiLoginCredPipe.dispose();
    submitPipe.dispose();
  }
}
