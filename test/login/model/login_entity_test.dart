import 'package:test/test.dart';
import 'package:wallet/features/login/model/dto/login_credential_dto.dart';
import 'package:wallet/features/login/model/login_entity.dart';


void main() {
  LoginEntity loginEntity;
  LoginEntity loginEntityMergeWithError;

  setUp((){
    final uiLoginCredentialDto = UiLoginCredentialDto(title: "title", id: "id", password: "password");

    loginEntity=LoginEntity(
      uiLoginCredentialDto: uiLoginCredentialDto
    );

    loginEntityMergeWithError=LoginEntity(
      errors: [],
      uiLoginCredentialDto: uiLoginCredentialDto
    );
  });
  test('loginEntity instantiation and properties test', () {

    expect(loginEntity.uiLoginCredDto.id, 'id');
    expect(loginEntity.uiLoginCredDto.password, 'password');
    //print(loginEntity.toString());

    expect(loginEntity.toString(), 'LoginEntity(Instance of \'UiLoginCredentialDto\', null, [])',
    );
  });

  test('LoginEntity merge with null errors', () {

    final  LoginEntity errorMergedEntity = loginEntityMergeWithError.merge(errors: null);
    expect(errorMergedEntity, isA<LoginEntity>());
    expect(errorMergedEntity.errors, []);
    expect(errorMergedEntity.uiLoginCredDto.id, 'id');
    expect(errorMergedEntity.uiLoginCredDto.password, 'password');

    expect(loginEntity.toString(), 'LoginEntity(Instance of \'UiLoginCredentialDto\', null, [])');

    });
}
