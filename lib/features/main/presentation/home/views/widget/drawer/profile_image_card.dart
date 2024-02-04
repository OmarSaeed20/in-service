import 'package:in_service/index.dart';

class ProfileImageCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? textColor;
  const ProfileImageCard({this.textColor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Kimage.logoPng),
        // SvgPicture.asset(Kimage.logo2),
        SvgPicture.asset(Kimage.inService),
      ],
    );
    /* GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: const NetworkImage(Kimage.network),
          ),
          10.sW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: gStyle14(
                  fontSize: 15,
                  color: textColor ??
                      (isDarkMode(context) ? KColors.white : KColors.textColor),
                  fontWeight: FontWeight.w700,
                ),
              ),
              5.sH,
              Text(
                '+20 1125134973',
                style: gStyle14(
                  color:
                      isDarkMode(context) ? KColors.white : KColors.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    ); */
  }
}
