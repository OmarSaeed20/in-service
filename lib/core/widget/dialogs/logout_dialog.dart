import 'package:in_service/index.dart';

class LogOutDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  const LogOutDialog({super.key, required this.opacity, required this.scale});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Transform.scale(
      scale: scale.value,
      child: Opacity(
        opacity: opacity.value,
        child: AlertDialog(
          insetPadding: gPaddingSymmetric(horizontal: 36),
          shape: RoundedRectangleBorder(borderRadius: 10.radius),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                foregroundColor: KColors.blueB.withOpacity(.4),
                radius: 25,
                child: ClipRRect(
                  borderRadius: 25.radius,
                  child: Image.asset(Kimage.logoPng),
                ),
              ),
              8.sH,
              Text(
                Kstrings.alertLogoutSup.tr,
                style: gStyle14(
                  color:
                      isDarkMode(context) ? KColors.white : KColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              20.sH,
              Row(
                children: [
                  Expanded(
                    child: BtnWidget(
                      height: 40,
                      backgroundColor: KColors.red,
                      onTap: () => Get.offAllNamed(Routes.login),
                      title: Kstrings.ok.tr,
                      radius: 10,
                    ),
                  ),
                  32.sW,
                  Expanded(
                    child: BtnWidget(
                      height: 40,
                      onTap: () => Get.back(),
                      title: Kstrings.cancel.tr,
                      backgroundColor: KColors.blueL,
                      radius: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
