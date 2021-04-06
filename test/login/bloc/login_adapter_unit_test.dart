import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/login/api/login_service_response_model.dart';
import 'package:wallet/features/login/bloc/login_service_adapter.dart';
import 'package:wallet/features/login/model/login_entity.dart';


void main() {
  LoginEntity initialLoginEntity;
  LoginServiceAdapter loginServiceAdapter;
  LoginServiceResponseModel loginServiceResponseModel;
  group('SERVICE ADAPTER METHOD TEST', ()
  {
    setUp(() {
      loginServiceAdapter = LoginServiceAdapter();
      loginServiceResponseModel= LoginServiceResponseModel.fromJson({ "firstName": "John",
        "lastName": "Doe",
        "loginStatus":true,
        "verified":true,
        "address": "Baneshwor"});
      initialLoginEntity = LoginEntity(uiLoginCredentialDto:null,responseModel: loginServiceResponseModel);

    });


    test(
        'new instance of LoginEntity is Created by ServiceAdapter with updated data from ResponseModel',
            () {
          final loginEntity = loginServiceAdapter.createEntity(
              initialLoginEntity,
              LoginServiceResponseModel.fromJson(
                  { "firstName": "John",
                    "lastName": "Doe",
                    "loginStatus":true,
                    "verified":true,
                    "address": "Baneshwor"}));
          //we expect entity is created based on above test
          //this test should pass
          expect(loginEntity, initialLoginEntity);
        });



    //NoSuchMethodError: The method 'merge' was called on null.
    //replace null with initialLoginEntity to pass the test
  /*  test(
        'null instance of Entity provider should fail',
            () {
          final loginEntity = loginServiceAdapter.createEntity(
              null,
              LoginServiceResponseModel.fromJSON(
                  {'logins': 'logins fetched from the backend api'}));

          expect(loginEntity, LoginEntity(logins: 'logins fetched from the backend api'));
        });*/
  });}
