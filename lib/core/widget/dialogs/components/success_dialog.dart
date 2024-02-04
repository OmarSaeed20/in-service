import 'package:in_service/index.dart';

class SuccessDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  final String title, sup, img;
  const SuccessDialog({
    super.key,
    required this.opacity,
    required this.scale,
    required this.title,
    required this.sup,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode(BuildContext context) =>
    //     Theme.of(context).brightness == Brightness.dark;

    return Transform.scale(
      scale: scale.value,
      child: Opacity(
        opacity: opacity.value,
        child: AlertDialog(
          icon: CircleAvatar(
            foregroundColor: KColors.blueB.withOpacity(.4),
            radius: 25,
            child: ClipRRect(
              borderRadius: 25.radius,
              child: ImageWidget(path: img),
            ),
          ),
          title: Text(
            title,
            style: gStyle18(fontWeight: FontWeight.bold),
          ),
          insetPadding: gPaddingSymmetric(horizontal: 36),
          shape: RoundedRectangleBorder(borderRadius: 15.radius),
          contentPadding: gPadding(top: 5, bottom: 10),
          content: Text(
            sup,
            textAlign: TextAlign.center,
            style: gStyle16(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
