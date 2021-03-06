import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/login/api/login_service.dart';
import 'package:wallet/features/login/api/login_service_response_model.dart';


void main() {
  LoginService loginService;
  //set a test for service request model (passed it to request)
  setUp(() {
    loginService = LoginService();
  });
  test('loginService success', () async {
    final eitherResponse = await loginService.request();

    expect(eitherResponse.isRight, isTrue);
    //this would pass if exact login success data fetched from backend is known
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      LoginServiceResponseModel.fromJson({
        "firstName": "John",
        "lastName": "Doe",
        "loginStatus": true,
        "verified": true,
        "address": "Baneshwor"
      }),
    );
  });
}
