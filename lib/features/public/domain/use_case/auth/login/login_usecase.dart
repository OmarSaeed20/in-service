import '/index.dart';

class LoginUseCase
    extends UseCaseWithParams<AuthenticationModel, LoginParameter> {
  final AuthenticationRepositoryImp _repo;

  LoginUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(LoginParameter params) =>
      _repo.login(params);
}

