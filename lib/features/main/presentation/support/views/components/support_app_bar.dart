import 'package:in_service/index.dart';

class SupportBar extends StatelessWidget implements PreferredSizeWidget {
  const SupportBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: Row(
        children: [
          SvgPicture.asset(
            Kimage.supportIcon,
            height: 30.h,
            colorFilter: ColorFilter.mode(
              isDarkMode(context) ? KColors.white : KColors.primary,
              BlendMode.srcIn,
            ),
          ),
          10.sW,
          Text(Kstrings.support.tr, style: gStyle14(fontSize: 15)),
        ],
      ),
     );
  }
}
