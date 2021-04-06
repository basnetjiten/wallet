import 'package:clean_framework/clean_framework.dart';
import 'package:wallet/features/login/api/login_service_response_model.dart';
import 'package:wallet/features/login/model/dto/login_credential_dto.dart';

class LoginEntity extends Entity {
  final UiLoginCredentialDto uiLoginCredDto;
  final LoginServiceResponseModel loginResponseModel;

  LoginEntity(
      {List<EntityFailure> errors = const [],
      UiLoginCredentialDto uiLoginCredentialDto,
      LoginServiceResponseModel responseModel})
      : uiLoginCredDto = uiLoginCredentialDto ?? UiLoginCredentialDto(title: '', id: '', password: ''),
        loginResponseModel = responseModel ?? null,

        super(errors: errors);

  @override
  List<Object> get props => [uiLoginCredDto, loginResponseModel, errors,];

  @override
  merge({errors,UiLoginCredentialDto uiLoginCredentialDto, LoginServiceResponseModel responseModel}) {
    return LoginEntity(
        errors: errors ?? this.errors,
       uiLoginCredentialDto: uiLoginCredentialDto ?? this.uiLoginCredDto,
        responseModel: responseModel ?? this.loginResponseModel);
  }
}
