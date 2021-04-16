import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/login/ui/login_feature_widget.dart';
import 'package:wallet/features/login/ui/login_presenter.dart';

void main() {
  testWidgets('Login  Widget Test', (tester) async {
    final testWidget = MaterialApp(
        home:  LoginFeatureWidget());

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 1000));
    expect(find.byType(LoginPresenter), findsOneWidget);
    expect(find.byType(LoginFeatureWidget), findsOneWidget);







    
    
  });
}




