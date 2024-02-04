import '/index.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LoadingWidget(),
        30.sH,
        Text(
          "Loading ...",
          style: gStyle20(
            fontWeight: FontWeight.w700,
            color: isDarkMode(context) ? KColors.white : KColors.textColor,
          ),
        ),
        Text(
          "please wait a second!",
          style: gStyle14(color: KColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        20.sH,
      ],
    );
  }
}
