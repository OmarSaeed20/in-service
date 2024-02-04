import 'package:in_service/index.dart';

class LoginRefreshUseCase extends UseCaseWithParams<TokenModel, TokenEntity> {
  final AuthenticationRepositoryImp _repo;

  LoginRefreshUseCase(this._repo);
  @override
  ResultFuture<TokenModel> call(TokenEntity params) =>
      _repo.loginRefresh(params);
}
