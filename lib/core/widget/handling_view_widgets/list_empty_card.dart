import 'package:in_service/index.dart';

class ListEmptyCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const ListEmptyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        30.sH,
        Text(
          title,
          style: gStyle20(
            fontWeight: FontWeight.w700,
            color: isDarkMode(context) ? KColors.white : KColors.textColor,
          ),
        ),
        Text(
          subtitle,
          style: gStyle14(color: KColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        20.sH,
        BtnWidget(onTap: () {}, title: 'View All Services'),
      ],
    );
  }
}
