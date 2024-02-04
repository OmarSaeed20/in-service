import '/index.dart';

class ResendCodeRegisterUseCase
    extends UseCaseWithParams<String, IdOnlyParameter> {
  final BaseAuthenticationRepository _repository;

  ResendCodeRegisterUseCase(this._repository);
  @override
  ResultFuture<String> call(IdOnlyParameter params) async =>
      await _repository.resendCodeRegister(params);
}
