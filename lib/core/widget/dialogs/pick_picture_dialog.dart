import 'package:in_service/index.dart';

class PickPictureDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  final VoidCallback camTap, galTap;
  const PickPictureDialog({
    super.key,
    required this.opacity,
    required this.scale,
    required this.camTap,
    required this.galTap,
  });

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
                Kstrings.addImage.tr,
                style: gStyle20(
                  color:
                      isDarkMode(context) ? KColors.white : KColors.textPrimary,
                ),
              ),
              20.sH,
              Row(
                children: [
                  Expanded(
                    child: BtnWidget(
                      height: 40,
                      onTap: camTap,
                      title: Kstrings.camera.tr,
                      radius: 10, backgroundColor: KColors.blueL,
                      // isBorder: true,
                    ),
                  ),
                  40.sW,
                  Expanded(
                    child: BtnWidget(
                      height: 40,
                      onTap: galTap,
                      title: Kstrings.gallery.tr,
                      backgroundColor: KColors.red,
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
