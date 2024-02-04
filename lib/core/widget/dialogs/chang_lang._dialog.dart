import 'package:in_service/index.dart';

class ChangeLangDialog extends StatelessWidget {
  const ChangeLangDialog({super.key, required this.controllerImp});
  final ChooseLanguageControllerImp controllerImp;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: 15.radius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: 15.radius,
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1),
            ),
          ],
        ),
        padding: gPaddingSymmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              Kstrings.changeLanguage.tr,
              textAlign: TextAlign.center,
              style: gStyle20(
                color:
                    isDarkMode(context) ? KColors.white : KColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            3.5.sH,
            Text(
              Kstrings.chooseLanguage.tr,
              textAlign: TextAlign.center,
              style: gStyle14(
                color:
                    isDarkMode(context) ? KColors.white : KColors.textPrimary,
              ),
            ),
            8.sH,
            Row(
              children: [
                Expanded(
                  child: BtnWidget(
                    height: 45,
                    onTap: () async {
                      await controllerImp.onSelectLang(lang: Keys.ar);
                      controllerImp.changeLanguage();
                    },
                    title: Kstrings.ar.tr,
                    backgroundColor: controllerImp.state.value.lang != Keys.ar
                        ? isDarkMode(context)
                            ? KColors.kContentColor
                            : KColors.grey
                        : KColors.blueB,
                    textStyle: gStyle16(
                      color: KColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                6.sW,
                Expanded(
                  child: BtnWidget(
                    height: 45,
                    onTap: () async {
                      await controllerImp.onSelectLang(lang: Keys.en);
                      controllerImp.changeLanguage();
                    },
                    title: Kstrings.en.tr,
                    backgroundColor: controllerImp.state.value.lang == Keys.ar
                        ? isDarkMode(context)
                            ? KColors.kContentColor
                            : KColors.grey
                        : KColors.blueB,
                    textStyle: gStyle16(
                      color: KColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
