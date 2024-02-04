import 'package:in_service/index.dart';

class AppBaar extends StatelessWidget implements PreferredSizeWidget {
  const AppBaar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: SvgPicture.asset(
          Kimage.menu,
          colorFilter: ColorFilter.mode(
            isDarkMode(context) ? KColors.white : KColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.supportView),
          icon: SvgPicture.asset(
            Kimage.messageIcon,
            colorFilter: ColorFilter.mode(
              isDarkMode(context) ? KColors.white : KColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Get.toNamed(Routes.notifications),
          icon: SvgPicture.asset(
            Kimage.notificationIcon,
            colorFilter: ColorFilter.mode(
              isDarkMode(context) ? KColors.white : KColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        10.sW,
      ],
    );
  }
}
