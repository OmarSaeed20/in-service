import 'package:in_service/index.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String icon;
  final bool isSelected;
  const SideMenu({
    super.key,
    this.isSelected = false,
    this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var isAr = AppPreferences.to.getLang == Keys.ar;
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: isSelected ? context.width / 1.7 : 0,
          height: 50.h,
          left: isAr ? null : 0,
          right: !isAr ? null : 0,
          child: Container(
            width: 10.w,
            decoration: BoxDecoration(
              color:
                  !isDarkMode(context) ? KColors.kContentColor : KColors.white,
              borderRadius: 10.radius,
            ),
          ),
        ),
        ListTile(
          onTap: onPressed,
          contentPadding: gPaddingSymmetric(horizontal: 12),
          dense: true,
          minLeadingWidth: 10.w,
          leading: SizedBox(
            width: 28.w,
            height: 28.h,
            child: SvgPicture.asset(
              icon,
              /* colorFilter: ColorFilter.mode(
                isSelected ? KColors.primary : KColors.white,
                BlendMode.srcIn,
              ), */
            ),
          ),
          title: Text(
            text,
            style: gStyle14(
              fontSize: 15,
              color: isSelected
                  ? KColors.primary
                  : !isDarkMode(context)
                      ? KColors.textPrimary
                      : KColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
