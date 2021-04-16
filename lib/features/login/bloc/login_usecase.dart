import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:wallet/features/login/bloc/login_service_adapter.dart';
import 'package:wallet/features/login/model/dto/login_credential_dto.dart';
import 'package:wallet/features/login/model/login_entity.dart';
import 'package:wallet/features/login/model/login_view_model.dart';
import 'package:wallet/features/login/model/mixins/login.dart';
import 'package:wallet/locator.dart';

class LoginUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;
  WalletAppLocator _loginAppLocator;

  LoginUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null) {
    _viewModelCallBack = viewModelCallBack;
    _loginAppLocator = WalletAppLocator();
  }

  void create() async {
    _scope = _loginAppLocator.repository.containsScope<LoginEntity>();
    if (_scope == null) {
      //if null create one and register in repository
      final newLoginEntity = LoginEntity();

      //create new scope if no scope found for for that entity
      _scope = _loginAppLocator.repository
          .create<LoginEntity>(newLoginEntity, _notifySubscribers);
      _viewModelCallBack(buildViewModelForLocalUpdate(newLoginEntity));
    } else {
      _scope.subscription = _notifySubscribers;
    }
  }

  void submit() async {
    final entity = WalletAppLocator().repository.get<LoginEntity>(_scope);
    if(entity.uiLoginCredDto!=null){
      _viewModelCallBack(buildViewModelProcessing(entity));
      //finally run the service adapter to request api for responseModel
      await _loginAppLocator.repository.runServiceAdapter(_scope,
          LoginServiceAdapter(loginCredentialDto: entity.uiLoginCredDto));
    }else{
      _viewModelCallBack(buildViewModelWithFieldError(entity));

    }



  }

  void updateLoginCred(UiLoginCredentialDto credentialDto) {
    updateViewModel(credentialDto);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  LoginViewModel buildViewModelForServiceUpdate(LoginEntity entity) {
    //print(entity.hasErrors().toString());
    if (entity.hasErrors() || entity.uiLoginCredDto == null) {
      return LoginViewModel(
          serviceStatus: LoginServiceStatus.fail,
          uiLoginCredentialDto: entity.uiLoginCredDto);
    } else {
      return LoginViewModel(
          uiLoginCredentialDto: entity.uiLoginCredDto,
          loginResponseModel: entity.loginResponseModel,
          serviceStatus: LoginServiceStatus.success);
    }
  }

  LoginViewModel buildViewModelForLocalUpdate(LoginEntity entity) {
    final loginViewModel = LoginViewModel(
        serviceStatus: LoginServiceStatus.initial,
        dataStatus: LoginDataStatus.valid,
        uiLoginCredentialDto: entity.uiLoginCredDto);

    return loginViewModel;
  }

  LoginViewModel buildViewModelProcessing(LoginEntity entity) {
    final loginViewModel = LoginViewModel(
        serviceStatus: LoginServiceStatus.processing,
        uiLoginCredentialDto: entity.uiLoginCredDto);

    return loginViewModel;
  }

  LoginViewModel buildViewModelWithFieldError(LoginEntity entity) {
    return LoginViewModel(
        dataStatus: LoginDataStatus.invalid,
        uiLoginCredentialDto: entity.uiLoginCredDto);
  }

  LoginViewModel buildViewModelForLocalUpdateWithError(LoginEntity entity) {
    return LoginViewModel(
        dataStatus: LoginDataStatus.invalid,
        uiLoginCredentialDto: entity.uiLoginCredDto);
  }

  updateViewModel(UiLoginCredentialDto credentialDto) {
    final entity = _loginAppLocator.repository.get<LoginEntity>(_scope);
    final updatedEntity = entity.merge(uiLoginCredentialDto: credentialDto);
    _loginAppLocator.repository.update<LoginEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildUpdatedViewModelWithFieldValue(updatedEntity));
  }

  ViewModel buildUpdatedViewModelWithFieldValue(LoginEntity updatedEntity) {
    return LoginViewModel(
        dataStatus: LoginDataStatus.unknown,
        uiLoginCredentialDto: updatedEntity.uiLoginCredDto);
  }
}

///when users type id , password and hit the submit button
////base even class
//invalid credentials-->inline validation messages
//servers errors-->inline validation messages
//success-->success screen
//the login credentials should not be cached
