import 'package:in_service/features/main/data/data_sorce/remote/home_client.dart';
import 'package:in_service/features/main/data/repository/home_repo_imp.dart';
import 'package:in_service/features/main/domain/use_case/home/get_home_usecase.dart';
import 'package:in_service/features/main/domain/use_case/my_account/logout_usecase.dart';

import 'features/notifications/data/data_source/remote/notifications_client.dart';
import 'features/notifications/data/repositories/notification_repo_imp.dart';
import 'features/notifications/domain/use_cases/block_notifications_use_case.dart';
import 'features/notifications/domain/use_cases/get_all_notifications_use_case.dart';
import 'index.dart';

Future<void> injection() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => prefs, fenix: true);
  Get.lazyPut<AppPreferences>(() => AppPreferences(prefs), fenix: true);
  Get.lazyPut(() => InternetConnectionChecker(), fenix: true);

  /* Get.lazyPut<ConnectionCheckerImpl>(
    () => ConnectionCheckerImpl(
      internetConnectionChecker: Get.find<InternetConnectionChecker>(),
    ),
    fenix: true,
  ); */
  await Get.putAsync(
    () => ConnectionCheckerImpl(
      internetConnectionChecker: Get.find<InternetConnectionChecker>(),
    ).init(),
  );

  Get.lazyPut<DioFactory>(
    () => DioFactory(Get.find<AppPreferences>()),
    fenix: true,
  );

//*   <<<<<<<<<<<<<<<<<<<<<<<<   Notification  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<GetNotificationUseCase>(
    () => GetNotificationUseCase(Get.find<NotificationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<BlockNotificationUseCase>(
    () => BlockNotificationUseCase(Get.find<NotificationRepositoryImp>()),
    fenix: true,
  );

//*   <<<<<<<<<<<<<<<<<<<<<<<<   Authentication   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // ? register
  Get.lazyPut<RegisterUseCase>(
    () => RegisterUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<VerifyCodeRegisterUseCase>(
    () => VerifyCodeRegisterUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<ResendCodeRegisterUseCase>(
    () => ResendCodeRegisterUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  // ? login
  Get.lazyPut<LoginRefreshUseCase>(
    () => LoginRefreshUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<LoginAnonymousUseCase>(
    () => LoginAnonymousUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<LoginUseCase>(
    () => LoginUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  // ? forget_password
  Get.lazyPut<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<VerifyEmailUseCase>(
    () => VerifyEmailUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<EmailAddressUseCase>(
    () => EmailAddressUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<TokenVerifyUseCase>(
    () => TokenVerifyUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
//*   <<<<<<<<<<<<<<<<<<<<<<<<   public >> My account   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<UpdatePasswordUsecase>(
    () => UpdatePasswordUsecase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetUserUseCase>(
    () => GetUserUseCase(repo: Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<GetAboutUsUseCase>(
    () => GetAboutUsUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> ads   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  /* Get.lazyPut<GetAllAdsUseCase>(
    () => GetAllAdsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<HideAdsUseCase>(
    () => HideAdsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  ); */
//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> Home   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Get.lazyPut<LogOutUseCase>(
    () => LogOutUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<GetHomeUseCase>(
    () => GetHomeUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );

//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> support   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Get.lazyPut<ContactUsUseCase>(
    () => ContactUsUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  //? RepositoryImp

  Get.lazyPut<AuthenticationRepositoryImp>(
    () => AuthenticationRepositoryImp(
      Get.find<AuthClient>(),
      Get.find<AppPreferences>(),
    ),
    fenix: true,
  );
  Get.lazyPut<NotificationRepositoryImp>(
    () => NotificationRepositoryImp(
      Get.find<NotificationClient>(),
      Get.find<AppPreferences>(),
    ),
    fenix: true,
  );
  
  Get.lazyPut<HomeRepositoryImp>(
    () => HomeRepositoryImp(Get.find<HomeClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );

  //? Data sources
  Get.lazyPut<NotificationClient>(
    () => NotificationClient(Get.find<DioFactory>().dio),
    fenix: true,
  );
  
  Get.lazyPut<AuthClient>(
    () => AuthClient(Get.find<DioFactory>().dio),
    fenix: true,
  );

  Get.lazyPut<HomeClient>(
    () => HomeClient(Get.find<DioFactory>().dio),
    fenix: true,
  );

  Get.putAsync<UserService>(
    () => UserService(
      networkInfo: Get.find<ConnectionCheckerImpl>(),
      pref: Get.find<AppPreferences>(),
      getUserUseCase: Get.find<GetUserUseCase>(),
    ).init(),
  );
}
