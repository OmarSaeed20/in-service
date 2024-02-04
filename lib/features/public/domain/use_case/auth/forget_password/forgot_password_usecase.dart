import '/index.dart';

class EmailAddressUseCase
    extends UseCaseWithParams<String, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  EmailAddressUseCase(this._repo);
  @override
  ResultFuture<String> call(
          ForgotPasswordParameter params) async =>
      await _repo.setEmailAddress(params);
}
