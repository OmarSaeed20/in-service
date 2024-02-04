import 'package:in_service/features/main/data/repository/home_repo_imp.dart';

import '/index.dart';

class LogOutUseCase extends UseCaseWithoutParams<void> {
  final HomeRepositoryImp _repo;

  LogOutUseCase(this._repo);
  @override
  ResultFuture<void> call() async => await _repo.logOut();
}
