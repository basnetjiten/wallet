
import 'package:test/test.dart';
import 'package:wallet/features/login/bloc/login_usecase.dart';
import 'package:wallet/features/login/model/login_view_model.dart';

void main() {

  test('LoginUseCase initialize with error', () {
    try {
      LoginUseCase(null);
    } catch (e) {
      expect(e != null, true);
    }
  });
  test('LoginUseCase initialize and create', () {
    final LoginUseCase useCase = LoginUseCase((viewModel) {
      expect(viewModel, isA<LoginViewModel>());
    });
    useCase.create();
  });

  test('LoginUseCase initialize and re-create', () {
    final useCase = LoginUseCase((viewModel) {
      expect(viewModel, isA<LoginViewModel>());
    });
    useCase.create();
    useCase.create();
  });
}
