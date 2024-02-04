import '/index.dart';
import 'choose_language_state.dart';

abstract class ChooseLanguageController extends GetxController {
  onSelectLang({required String lang});
  changeLanguage();
  final Rx<ChooseLanguageState> state = const ChooseLanguageState().obs;
}

class ChooseLanguageControllerImp extends ChooseLanguageController {
  ChooseLanguageControllerImp(this._appPreferences);
  final AppPreferences _appPreferences;
  static ChooseLanguageControllerImp get to =>
      Get.find<ChooseLanguageControllerImp>();
  @override
  onSelectLang({required String lang}) async => switch (lang) {
        (Keys.ar || Keys.en) => {
            state(state.value.copyWith(lang: lang)),
            Get.updateLocale(Locale(lang)),
          },
        _ => toast("soon".tr),
      };

  @override
  changeLanguage() async {
    state(state.value.copyWith(rx: handleRxLoading()));
    await _appPreferences.setLang(state.value.lang).then((value) => {
          switch (Get.currentRoute) {
            Routes.main => Get.back(),
            _ => () {},
          },
          state(state.value.copyWith(rx: RequestState.success)),
        });
  }

  @override
  void onInit() {
    //debugPrint(state.value.lang);
    //debugPrint(_appPreferences.getLang);
    state(state.value.copyWith(lang: _appPreferences.getLang));
    //debugPrint("state.value.lang");
    //debugPrint(state.value.lang);
    //debugPrint(_appPreferences.getLang);
    super.onInit();
  }
}
