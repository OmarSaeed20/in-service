import 'package:in_service/core/widget/dialogs/exit_dialog.dart';

import '/index.dart';
import 'main_state.dart';

abstract class MainController extends GetxController {
  void changePage({required int index});
}

class MainControllerImp extends MainController {
  MainControllerImp({required this.database});
  final AppPreferences database;

  final Rx<MainState> state = const MainState().obs;

  Future<bool> onWillPop(BuildContext context) {
    if (state.value.currentIndex == 0) {
      showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) =>
            ExitDialog(opacity: a1, scale: a1),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: 'Exit',
        context: context,
        pageBuilder: (context, a1, a2) => const SizedBox.shrink(),
      );
      /* DialogManager.showAcceptDialog(
        "are you sure you want to exit app",
        // dialogType: DialogType.CONFIRMATION,
        context: context,
        onAccept: () => SystemNavigator.pop(),
      ); */
      return Future.value(true);
    } else {
      changePage(index: 0);
      return Future.value(false);
    }
  }

  @override
  void changePage({required int index}) {
    state(state.value.copyWith(currentIndex: index));
    switch (index) {
      case 0:
      case 1:
      // AllChatsBinding().dependencies();
      case 2:
      // VideoBinding().dependencies();
      // AdvertisementsBinding().dependencies();
      case 3:
      // SearchBinding().dependencies();
      case 4:
      // AccountBinding().dependencies();
      // ChooseLanguageBinding().dependencies();
      // NotificationsBinding().dependencies();
    }
    /* 
    => switch (index) {
        0 => HomeBinding().dependencies(),
        1 => AllChatsBinding().dependencies(),
        2 => {
            AdvertisementsBinding().dependencies(),
            VideoBinding().dependencies(),
          },
        3 => VipBinding().dependencies(),
        4 => AccountBinding().dependencies(),
        _ => () {},
      };
     */
  }
}
