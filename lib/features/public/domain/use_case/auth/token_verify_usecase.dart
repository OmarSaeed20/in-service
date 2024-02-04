import 'package:in_service/index.dart';

class TokenVerifyUseCase
    extends UseCaseWithParams<TokenVerifyModel, StringOnlyParameter> {
  final AuthenticationRepositoryImp _repo;

  TokenVerifyUseCase(this._repo);
  @override
  ResultFuture<TokenVerifyModel> call(StringOnlyParameter params) =>
      _repo.tokenVerify(params);
}
