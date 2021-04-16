import 'package:test/test.dart';
import 'package:wallet/features/login/model/dto/login_credential_dto.dart';
import 'package:wallet/features/login/model/login_view_model.dart';


void main() {
  LoginViewModel loginViewModel;
  setUp((){
    final uiLoginCredentialDto = UiLoginCredentialDto( id: "id", password: "password");

    loginViewModel= LoginViewModel(
      uiLoginCredentialDto: uiLoginCredentialDto
    );

  });
  test('Instantiate LoginViewModel', () async {
    expect(loginViewModel.uiLoginCredentialDto.id, 'id');
    expect(loginViewModel.uiLoginCredentialDto.password, 'password');
  });

  test('LoginViewModel initialize with error', () async {
    try {
      LoginViewModel(
          uiLoginCredentialDto: null
      );
    } catch (error) {
      //'keyword != null && artist != null': is not true
      expect(error != null, true);
    }
  });
}
