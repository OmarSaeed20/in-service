import '/index.dart';

class VerifyCodeRegisterUseCase
    extends UseCaseWithParams<String, VerifyParameter> {
  final BaseAuthenticationRepository _repository;

  VerifyCodeRegisterUseCase(this._repository);
  @override
  ResultFuture<String> call(VerifyParameter params) async =>
      await _repository.verifyCodeRegister(params);
}
