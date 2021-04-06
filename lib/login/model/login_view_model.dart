import 'package:clean_framework/clean_framework.dart';
import 'package:wallet/login/api/login_service_response_model.dart';
import 'package:wallet/login/model/dto/login_credential_dto.dart';

class LoginViewModel extends ViewModel {
  final UiLoginCredentialDto uiLoginCredentialDto;
  final LoginServiceResponseModel loginResponseModel;
  final serviceStatus;
  final dataStatus;

  LoginViewModel(
      {this.uiLoginCredentialDto,
      this.loginResponseModel,
      this.serviceStatus = LoginServiceStatus.unknown,
      this.dataStatus = LoginDataStatus.unknown})
      : assert(uiLoginCredentialDto.id != null &&
            uiLoginCredentialDto.password != null);

  @override
  List<Object> get props =>
      [uiLoginCredentialDto, loginResponseModel, serviceStatus, dataStatus];
}

enum LoginServiceStatus { initial, processing, success, fail, unknown }
enum LoginDataStatus { valid, invalid, unknown }
