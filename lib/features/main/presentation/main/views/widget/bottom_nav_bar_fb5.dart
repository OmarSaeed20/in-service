import 'package:in_service/features/notifications/presentation/notifications/controllers/notifications_controller.dart';

import '/index.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onTap,
    required this.img,
    required this.text,
    required this.isActive,
  });
  final VoidCallback onTap;
  final String img, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive
              ? SvgPicture.asset(img, height: 30)
                  .animate()
                  .fadeIn(curve: Curves.easeInOutCirc)
                  .scaleX()
                  .shimmer(delay: const Duration(milliseconds: 500))
                  .scale(delay: const Duration(milliseconds: 100))
              : SvgPicture.asset(img, height: 30, color: KColors.secondary),
          /*  isActive
              ? ImageWidget(
                      path: img, height: /*  context.width < 350 ? 18 : */ 30)
                  .animate()
                  .fadeIn(curve: Curves.easeInOutCirc)
                  .scaleX()
                  .shimmer(delay: const Duration(milliseconds: 500))
                  .scale(delay: const Duration(milliseconds: 100))
              : ImageWidget(
                  path: img,
                  fit: BoxFit.fill,
                  color: isActive
                      ? KColors.primary
                      : KColors.primary.withOpacity(.5),
                  height: /* context.width < 350 ? 18 : */ 30,
                ),
           */
          4.sH,
          Text(
            text,
            style: gStyle14(
              color: isActive ? KColors.primary : KColors.secondary,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
