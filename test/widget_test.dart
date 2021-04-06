import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/login/bloc/login_bloc.dart';
import 'package:wallet/features/login/ui/login_feature_widget.dart';
import 'package:wallet/features/login/ui/login_presenter.dart';
import 'package:wallet/features/login/ui/login_screen.dart';

void main() {
  testWidgets('Login  Widget Test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(), child: LoginFeatureWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 1000));
    expect(find.byType(LoginPresenter), findsOneWidget);
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byKey(ValueKey("password")),findsOneWidget);
    expect(find.byKey(ValueKey("user_id")),findsOneWidget);





    
    
  });
}




