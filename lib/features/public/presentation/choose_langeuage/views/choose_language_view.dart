import '/index.dart';

class ChooseLanguageView extends GetView<ChooseLanguageController> {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    /* return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          animating: true,
        ),
      ),
    ); */
    return Obx(
      () => Scaffold(
        // SAVE LANG BUTTON
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BtnWidget(
              margin: gPadding(bottom: 40, right: 16, left: 16),
              rx: controller.state.value.rx,
              onTap: () => controller.changeLanguage(),
              title: Kstrings.continueText.tr,
            ),
          ],
        ),
        appBar: AppBar(elevation: 0),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: gPadding(right: 16, left: 16 /* , top: 16 */),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //LOGO
                const ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    KColors.primary,
                    // Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                  child: ImageWidget(
                    path: Kimage.logo,
                    height: 140,
                    fit: BoxFit.fill,
                  ),
                ),
                //WELCOME MESSAGE
                Text(
                  "Kstrings.welcomeWithEmotion.tr",
                  style: gStyle20(fontWeight: FontWeight.w700),
                ),
                15.sH,
                // WELCOME CHOOSE LANG MESSAGE
                Text(
                  Kstrings.chooseLanguage.tr,
                  textAlign: TextAlign.center,
                  style: gStyle16(color: KColors.textGray),
                ),
                32.sH,
                _LanguageRadioBox(
                  index: 1,
                  isChosen: controller.state.value.lang == Keys.ar,
                  value: controller.state.value.lang,
                  groupValue: Keys.ar,
                  onChanged: (value) => controller.onSelectLang(lang: value!),
                  onTap: () => controller.onSelectLang(lang: Keys.ar),
                  text: Keys.ar,
                  image: Kimage.srIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageRadioBox extends StatelessWidget {
  const _LanguageRadioBox({
    required this.isChosen,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.image,
    required this.onTap,
    required this.index,
  });
  final bool isChosen;
  final void Function(String?)? onChanged;
  final void Function() onTap;
  final String text, image, groupValue, value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: 3.radius,
        border: Border.all(
          color: isChosen ? KColors.primary : KColors.fillBorder,
          width: (isChosen ? .8 : .5).w,
        ),
      ),
      child: AnimationListWidget(
        index: index,
        horizontal: 25,
        child: ListTile(
          contentPadding: gPadding(),
          splashColor: KColors.primary.withOpacity(.2),
          hoverColor: KColors.primary.withOpacity(.2),
          shape: const BeveledRectangleBorder(
              /*   borderRadius: 3.radius,
             side: BorderSide(
              color: isChosen ? KColors.primary : KColors.greyLight,
              width: .5.w,
            ), */
              ),
          title: Text(
            text.tr,
            textAlign: TextAlign.start,
            style: gStyle16(fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
          trailing: Radio.adaptive(
            activeColor: KColors.primary,
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onTap,
          ),
          leading: Padding(
            padding: gPaddingAll(16),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}
