import '/core/util/utils.dart';

import '/index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseLanguageControllerImp controllerImp = ChooseLanguageControllerImp.to;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const _BottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ChooseLang(controllerImp: controllerImp),
              Image.asset(Kimage.logoPng),
              SvgPicture.asset(Kimage.inService),
              55.sH,
              const _LoginBody()
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 1000))
                  .effect(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChooseLang extends StatelessWidget {
  const _ChooseLang({required this.controllerImp});

  final ChooseLanguageControllerImp controllerImp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => DropDownMenuFb1(
            controllerImp: controllerImp,
            icon: Row(
              children: [
                SvgPicture.asset(
                  controllerImp.state.value.lang == Keys.ar
                      ? Kimage.srIcon
                      : Kimage.ukIcon,
                  height: 22.h,
                  width: 30.w,
                ),
                Padding(
                  padding: gPaddingSymmetric(horizontal: 2.5),
                  child: Text(
                    controllerImp.state.value.lang.tr,
                    style: gStyle14(),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: KColors.primary,
                  size: 20.h,
                )
              ],
            ),
          ),
        ),
        TxtBtn(
          Row(
            children: [
              Text(
                "تسجيل دخول الادارة",
                style: gStyle14(color: KColors.white),
              ),
              7.sW,
              Icon(
                AppPreferences.to.getLang == Keys.ar
                    ? Icons.arrow_forward
                    : Icons.arrow_back,
                color: KColors.white,
              )
            ],
          ),
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(
              borderRadius: AppPreferences.to.getLang == Keys.ar
                  ? BorderRadius.only(
                      topRight: 5.radiusCircular,
                      bottomRight: 5.radiusCircular,
                    )
                  : BorderRadius.only(
                      topLeft: 5.radiusCircular,
                      bottomLeft: 5.radiusCircular,
                    ),
            ),
          ),
          color: KColors.blueB,
          onTap: () {
            Get.toNamed(Routes.main);
          },
        ),
      ],
    );
  }
}

class DropDownMenuFb1 extends StatelessWidget {
  const DropDownMenuFb1({
    required this.icon,
    required this.controllerImp,
    super.key,
  });

  final ChooseLanguageControllerImp controllerImp;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: KColors.white,
      icon: icon,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(Kimage.srIcon, fit: BoxFit.fill),
              Padding(
                padding: gPaddingSymmetric(horizontal: 4),
                child: Text(Kstrings.ar.tr, style: gStyle14()),
              ),
            ],
          ),
          onTap: () async {
            await controllerImp.onSelectLang(lang: Keys.ar);
            controllerImp.changeLanguage();
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(Kimage.ukIcon, fit: BoxFit.fill),
              Padding(
                padding: gPaddingSymmetric(horizontal: 4),
                child: Text(
                  Kstrings.en.tr,
                  style: gStyle14(),
                ),
              ),
            ],
          ),
          onTap: () async {
            await controllerImp.onSelectLang(lang: Keys.en);
            controllerImp.changeLanguage();
          },
        ),
      ],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: gPaddingSymmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: gPaddingSymmetric(vertical: 16),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Kstrings.dontHaveAccount.tr,
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                5.sW,
                TextButton(
                  onPressed: () => Get.toNamed(Routes.register),
                  child: Text(
                    Kstrings.createNewAccount.tr,
                    style: gStyle16(
                      color: KColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBody extends GetView<LoginController> {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
        child: Padding(
          padding: gPaddingSymmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputWidget(
                hintText: Kstrings.mobileNumber.tr,
                prefixIcon: Row(
                  children: [
                    CountryCodePicker(
                      padding: EdgeInsets.zero,
                      onChanged: (value) => controller.onChangedPhone(
                        codeCountry: value.dialCode,
                      ),
                      initialSelection: controller.state.value.codeCountry,
                      favorite: const ["+20"],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Container(
                      width: 1.w,
                      height: 40.h,
                      color: KColors.greyDark,
                    ),
                  ],
                ),
                type: TextInputType.phone,
                suffixIcon: Icons.phone_iphone_rounded,
                onChanged: (phone) => controller.onChangedPhone(phone: phone),
                validator: (value) =>
                    Utils.inputValidator('$value', type: Type.phone),
              ),
              24.sH,
              // Pass Controller
              TextInputWidget(
                hintText: Kstrings.password.tr,
                type: TextInputType.visiblePassword,
                prefixIcon: Kimage.lockIcon,
                suffixIcon: controller.state.value.suffixIcon,
                isPassword: controller.state.value.isPassword,
                onChanged: (value) =>
                    controller.onChangedPassword(value: '$value'),
                onPressed: () => controller.toggleObscure(),
                validator: (value) =>
                    Utils.inputValidator('$value', type: Type.password),
              ),
              16.sH,
              // Forget Password BUTTON
              Align(
                alignment: Alignment.centerLeft,
                child: TxtBtn(
                  Text(
                    Kstrings.forgetPassword.tr,
                    style: gStyle14(fontWeight: FontWeight.w700),
                  ),
                  onTap: () => Get.toNamed(Routes.forgotPassword),
                ),
              ),
              24.sH,
              BtnWidget(
                title: Kstrings.login.tr,
                rx: controller.state.value.rx,
                onTap: controller.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SochialIcon extends StatelessWidget {
  const SochialIcon(this.img, {super.key, this.bColor, this.type});
  final String? img, type;
  final Color? bColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        decoration: BoxDecoration(
          color: bColor,
          border: Border.all(
            color:
                bColor == null ? const Color(0xFF42413E) : KColors.transparent,
            width: .7.w,
          ),
          borderRadius: 10.radius,
        ),
        height: 40.h,
        width: 40.h,
        padding: gPaddingAll(0),
        margin: gPaddingSymmetric(horizontal: bColor == null ? 10 : 6),
        child: FittedBox(
          fit: BoxFit.cover,
          child: ImageWidget(height: 22.5, width: 22.5, path: img),
        ),
      ),
    );
  }
}
