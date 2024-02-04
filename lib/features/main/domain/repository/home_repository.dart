import '/features/main/data/model/home_model.dart';

import '/index.dart';

abstract class BaseHomeRepository {
  ResultFuture<HomeModel> getHome();
  ResultFuture<void> logOut();
  ResultFuture<void> deleteAccount();

}
