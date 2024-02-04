import 'package:in_service/features/main/data/repository/home_repo_imp.dart';

import '/index.dart';

class DeleteAccountUseCase extends UseCaseWithoutParams<void> {
  final HomeRepositoryImp _repo;

  DeleteAccountUseCase(this._repo);
  @override
  ResultFuture<void> call() async => await _repo.deleteAccount();
}
