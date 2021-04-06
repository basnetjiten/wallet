import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:wallet/features/login/api/login_service_request_model.dart';
import 'package:wallet/features/login/api/login_service_response_model.dart';
import 'package:wallet/locator.dart';


class LoginService
    extends EitherService<LoginServiceRequestModel, LoginServiceResponseModel> {

  LoginService()
      : super(
            method: RestMethod.post,
            restApi: LoginAppLocator().api,
            path: 'user-login');

  @override
  LoginServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return LoginServiceResponseModel.fromJson(jsonResponse);
  }


}
