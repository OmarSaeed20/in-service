import '/index.dart';

class VerifyEmailUseCase
    extends UseCaseWithParams<String, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  VerifyEmailUseCase(this._repo);
  @override
  ResultFuture<String> call(
          ForgotPasswordParameter params) async =>
      await _repo.verifyEmailAddress(params);
}
