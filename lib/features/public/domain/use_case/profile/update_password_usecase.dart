import '/index.dart';

class UpdatePasswordUsecase
    extends UseCaseWithParams<void, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  UpdatePasswordUsecase(this._repo);
  @override
  ResultFuture<void> call(ForgotPasswordParameter params) async =>
      await _repo.updatePassword(params);
}
