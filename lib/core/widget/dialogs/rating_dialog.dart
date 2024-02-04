import 'package:in_service/index.dart';

import 'components/rating_field.dart';

class RatingDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  const RatingDialog({super.key, required this.opacity, required this.scale});

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
              Text('Rate ${Kstrings.projectName}',
                  style: gStyle20(
                    color: isDarkMode(context)
                        ? KColors.white
                        : KColors.textPrimary,
                  )),
              10.sH,
              Text(
                'Your feedback will help us to make improvements',
                style: gStyle14(
                  color:
                      isDarkMode(context) ? KColors.white : KColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              16.sH,
              CustomRatingField(onChanged: (value) {}),
              20.sH,
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: BtnWidget(
                      height: 40,
                      onTap: () => Get.back(),
                      title: 'No, Thanks',
                      radius: 10, backgroundColor: KColors.blueL,
                      // isBorder: true,
                    ),
                  ),
                  10.sW,
                  Expanded(
                    flex: 6,
                    child: BtnWidget(
                      height: 40,
                      onTap: () => Get.back(),
                      title: 'Rate on Play Store',
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
