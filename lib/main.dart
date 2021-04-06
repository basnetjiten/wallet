import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'locator.dart';
import 'routes.dart';

void main() {
  //Locator.init(Locator());
  logger().setLogLevel(LogLevel.verbose);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.green, statusBarColor: Colors.green));

  runApp(
    CFRouterScope(
      routeGenerator: LoginFinderRouter.generate,
      initialRoute: LoginFinderRouter.initialRoute,
      builder: (context) => MaterialApp.router(
        routeInformationParser: CFRouteInformationParser(),
        routerDelegate: CFRouterDelegate(context),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
