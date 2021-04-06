import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'core/patch_simple_rest_api.dart';

LoginAppLocator locator() => LoginAppLocator();

Logger logger() => LoginAppLocator().logger;


class LoginAppLocator implements Locator {
  LoginAppLocator._();

  factory LoginAppLocator() {
    Locator.instance ??= LoginAppLocator._();
    return Locator.instance;
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.verbose);


  PatchSimpleRestApi api = PatchSimpleRestApi(
      baseUrl: 'http://127.0.0.1:3000/'); // Points to Mockoon instance

  Repository repository = Repository();
}
