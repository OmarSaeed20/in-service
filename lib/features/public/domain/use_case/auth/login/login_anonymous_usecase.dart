import 'package:in_service/index.dart';

class LoginAnonymousUseCase extends UseCaseWithoutParams<AuthenticationModel> {
  final AuthenticationRepositoryImp _repo;

  LoginAnonymousUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call() => _repo.anonymous();
}
