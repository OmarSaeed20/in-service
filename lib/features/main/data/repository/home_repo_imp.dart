
import 'package:in_service/features/main/data/data_sorce/remote/home_client.dart';

import '/features/main/data/model/home_model.dart';
import '/features/main/domain/repository/home_repository.dart';

import '/index.dart';

class HomeRepositoryImp implements BaseHomeRepository {
  HomeRepositoryImp(this._remoteData, this._preferences);
  final HomeClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<HomeModel> getHome() async => executAndHandelError<HomeModel>(
        () => _remoteData.getHome(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<void> deleteAccount() async => executAndHandelError<void>(
        () => _remoteData.deleteAccount(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<void> logOut() async => executAndHandelError<void>(
        () => _remoteData.logout(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
}
