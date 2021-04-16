import 'package:flutter/cupertino.dart';
import 'package:wallet/features/login/model/mixins/login.dart';

class UiLoginCredentialDto with CommonFieldValidationMixin {
  String id, password = '';

  UiLoginCredentialDto({@required this.id, @required this.password});

  bool checkIfAnyIsNull() {
    return [id, password].contains(null);
  }

  String isIdFieldEmpty() {
    if (isFieldEmpty(id)) {
      return 'ID is required field';
    }
    return null;
  }

  String isPasswordFieldEmpty() {
    if (isFieldEmpty(password)) {
      return 'Password is required field';
    }
    return null;
  }
}
