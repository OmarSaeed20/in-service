import 'package:in_service/core/widget/dialogs/chang_lang._dialog.dart';
import 'package:in_service/core/widget/dialogs/logout_dialog.dart';
import 'package:in_service/core/widget/dialogs/rating_dialog.dart';
import 'package:in_service/index.dart';

import 'profile_image_card.dart';
import 'side_menu.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedMenu = 10;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    ChooseLanguageControllerImp controllerImp = ChooseLanguageControllerImp.to;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topLeft,
            colors: [
              // if (isDarkMode(context))
              ...[
                isDarkMode(context) ? KColors.kDarkInput : KColors.white,
                isDarkMode(context) ? KColors.kDarkInput : KColors.white,
                isDarkMode(context) ? KColors.secondary : KColors.white,
              ]
            ],
          ),
        ),
        padding: gPadding(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 30.sH,
            Padding(
              padding: gPaddingSymmetric(horizontal: 47, vertical: 30),
              child: ProfileImageCard(onTap: () {}),
            ),
            Obx(
              () => SideMenu(
                onPressed: () {
                  setState(() => selectedMenu = 0);
                  Get.dialog(ChangeLangDialog(controllerImp: controllerImp))
                      .then((value) => setState(() => selectedMenu = 10));
                },
                icon: Kimage.lang,
                isSelected: selectedMenu == 0,
                text: controllerImp.state.value.lang.tr,
              ),
            ),
            5.sH,
            SideMenu(
              onPressed: () {
                setState(() {
                  selectedMenu = 3;
                });
                Get.back();
                Get.toNamed(Routes.notifications);
              },
              icon: Kimage.notificationIcon,
              isSelected: selectedMenu == 3,
              text: Kstrings.notifications.tr,
            ),

            /* 5.sH,
            SideMenu(
              onPressed: () {
                setState(() {
                  selectedMenu = 6;
                });
              },
              icon: Kimage.logout,
              isSelected: selectedMenu == 6,
              text: 'Support',
            ), */
            5.sH,
            SideMenu(
              onPressed: () {
                setState(() => selectedMenu = 7);
                showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) =>
                      RatingDialog(opacity: a1, scale: a1),
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, a1, a2) => const SizedBox.shrink(),
                ).then((value) => setState(() => selectedMenu = 10));
              },
              icon: Kimage.kHelp,
              isSelected: selectedMenu == 7,
              text: 'قيمنا الان',
            ),
            5.sH,
            SideMenu(
              onPressed: () {
                setState(() => selectedMenu = 2);
                showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) =>
                      LogOutDialog(opacity: a1, scale: a1),
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, a1, a2) => const SizedBox.shrink(),
                ).then((value) => setState(() => selectedMenu = 10));
              },
              icon: Kimage.logout,
              isSelected: selectedMenu == 2,
              text: Kstrings.logout.tr,
            ),
            /*const Spacer(),
            const Divider(color: KColors.fillBorder),
            const SideMenu(
              isSelected: false,
              icon: Kimage.kHelp,
              text: 'Color Scheme',
            ),
              GetBuilder<ThemeController>(
              init: Get.find<ThemeController>(),
              initState: (_) {},
              builder: (_) => ToggleButton(
                onDarkModeSelected: () => _.setTheme(ThemeOptions.dark),
                onLightModeSelected: () => _.setTheme(ThemeOptions.light),
              ),
            ),
             */
            20.sH,
          ],
        ),
      ),
    );
  }
}
