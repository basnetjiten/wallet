import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class LoginServiceRequestModel extends Equatable implements JsonRequestModel {
  final String title;
  final String userId;
  final String password;

  LoginServiceRequestModel({this.title="Mr", this.userId,this.password});

  @override
  Map<String, dynamic> toJson() {
    return {"title": "Mr", "userId": userId,"password":password};
  }

  @override
  List<Object> get props => [title, userId,password];
}
