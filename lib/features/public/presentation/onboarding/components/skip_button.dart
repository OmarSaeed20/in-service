import 'package:in_service/core/widget/button/button_animation.dart';
import 'package:in_service/index.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;
  const SkipButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: gPaddingSymmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: 30.radius,
            color: KColors.secondary,
          ),
          child: Text(
            Kstrings.skip.tr,
            style: gStyle14(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
