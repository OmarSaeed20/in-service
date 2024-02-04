import 'package:in_service/features/main/presentation/account/bindings/account_binding.dart';
import 'package:in_service/features/main/presentation/home/bindings/home_binding.dart';
import 'package:in_service/features/main/presentation/main/bindings/main_binding.dart';
import 'package:in_service/features/main/presentation/main/views/main_view.dart';
import 'package:in_service/features/main/presentation/reservation_details/bindings/reservation_details_binding.dart';
import 'package:in_service/features/main/presentation/reservation_details/views/reservation_details_view.dart';
import 'package:in_service/features/main/presentation/reservations/bindings/reservations_binding.dart';
import 'package:in_service/features/main/presentation/support/bindings/support_binding.dart';
import 'package:in_service/features/main/presentation/support/views/support_view.dart';
import 'package:in_service/features/main/presentation/vendor_details/bindings/vendor_details_binding.dart';
import 'package:in_service/features/main/presentation/vendor_details/views/vendor_details_view.dart';
import 'package:in_service/features/main/presentation/search/bindings/search_binding.dart';
import 'package:in_service/features/notifications/presentation/notifications/bindings/notifications_binding.dart';
import 'package:in_service/features/notifications/presentation/notifications/views/notifications_view.dart';
import 'package:in_service/features/public/presentation/onboarding/onboarding_view.dart';
import 'package:in_service/features/select_map_location/presentation/bindings/select_map_location_binding.dart';
import 'package:in_service/features/select_map_location/presentation/view/select_map_location.dart';

import '/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.init,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnboardingView(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      bindings: [ChooseLanguageBinding(), LoginBinding()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => const VerifyCodeView(),
      binding: VerifyCodeBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.verifyForgetPass,
      page: () => const VerifyForgetPassView(),
      binding: VerifyForgetPassBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.resetForgetPass,
      page: () => const ResetForgetPassView(),
      binding: ResetForgetPassBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      bindings: [
        MainBinding(),
        HomeBinding(),
        ReservationsBinding(),
        SearchBinding(),
        AccountBinding(),
        ThemeBinding(),
        NotificationsBinding(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePassView(),
      binding: ChangePassBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.editAccount,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.vendorDetailsView,
      page: () => const VendorDetailsView(),
      binding: VendorDetailsBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.reservationDetails,
      page: () => const ReservationDetailsView(),
      binding: ReservationDetailsBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.supportView,
      page: () => const SupportView(),
      binding: SupportBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.contactUsView,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const SelectMapLocationView(),
      binding: SelectMapLocationBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.aboutUsView,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.privacy,
      page: () => const PrivacyView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.terms,
      page: () => const TermsView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
  ];
}
