import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class LoginServiceResponseModel extends Equatable implements JsonResponseModel {
  final String firstName,lastName,address;
  final bool loginStatus,verified;

  LoginServiceResponseModel.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        address = json['address'] ?? '',
        loginStatus = json['loginStatus'] ?? '',
        verified = json['verified'] ?? '';


  @override
  String toString()=>  "loginStatus: ${loginStatus}, firstName: ${firstName}, lastName: ${lastName}, address: ${address}, verified: ${verified}";


  @override
  List<Object> get props => [firstName, lastName, address, loginStatus];
}
