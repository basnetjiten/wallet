import 'package:flutter/material.dart';
import 'package:wallet/login/ui/login_feature_widget.dart';

abstract class LoginFinderRouter {
  static const String initialRoute = '/';


  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LoginFeatureWidget();


      default:
        return const PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404, Page Not Found!')));
  }
}
