
import '/index.dart';

class RegisterUseCase
    extends UseCaseWithParams<AuthenticationModel, RegisterParameter> {
  final BaseAuthenticationRepository _repository;

  RegisterUseCase(this._repository);
  @override
  ResultFuture<AuthenticationModel> call(RegisterParameter params) async =>
      await _repository.register(params);
}