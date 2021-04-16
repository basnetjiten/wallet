import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'core/patch_simple_rest_api.dart';

WalletAppLocator locator() => WalletAppLocator();

Logger logger() => WalletAppLocator().logger;


class WalletAppLocator implements Locator {
  WalletAppLocator._();

  factory WalletAppLocator() {
    Locator.instance ??= WalletAppLocator._();
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
