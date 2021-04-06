import 'package:clean_framework/clean_framework.dart';
import 'package:wallet/login/api/login_service.dart';
import 'package:wallet/login/api/login_service_request_model.dart';
import 'package:wallet/login/api/login_service_response_model.dart';
import 'package:wallet/login/model/dto/login_credential_dto.dart';
import 'package:wallet/login/model/login_entity.dart';

class LoginServiceAdapter extends ServiceAdapter<LoginEntity,
    LoginServiceRequestModel, LoginServiceResponseModel, LoginService> {
  final UiLoginCredentialDto _loginCredentialDto;

  LoginServiceAdapter({loginCredentialDto})
      : _loginCredentialDto = loginCredentialDto,
        super(LoginService());

  @override
  LoginServiceRequestModel createRequest(LoginEntity entity) {
    return LoginServiceRequestModel(
        title: "MR",
        userId: _loginCredentialDto.id,
        password: _loginCredentialDto.password);
  }

  @override
  LoginEntity createEntity(initialEntity, responseModel) {
    return initialEntity
        .merge(errors: <EntityFailure>[], responseModel: responseModel);
  }
}
