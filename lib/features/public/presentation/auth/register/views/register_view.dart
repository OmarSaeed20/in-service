import '/core/util/utils.dart';

import '/index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          Kstrings.signUp.tr,
          style: gStyle20(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Kimage.logoPng),
            SvgPicture.asset(Kimage.inService),
            55.sH,
            const _RegisterBody(),
          ],
        ),
      ),
    );
  }
}

class _RegisterBody extends GetView<RegisterControllerImp> {
  const _RegisterBody();

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
                hintText: Kstrings.userName.tr,
                type: TextInputType.name,
                prefixIcon: Icons.person_outline,
                txAction: TextInputAction.next,
                suffixIconColor:
                    !GetUtils.isBlank(controller.state.value.username)!
                        ? Colors.green.shade600
                        : KColors.grey,
                suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
                onChanged: (value) =>
                    controller.onChangedUsername(value: '$value'),
                validator: (value) =>
                    Utils.inputValidator('$value', type: Type.username),
              ),
              25.sH,
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
              25.sH,
              TextInputWidget(
                hintText: Kstrings.password.tr,
                type: TextInputType.visiblePassword,
                txAction: TextInputAction.next,
                prefixIcon: Kimage.lockIcon,
                suffixIcon: controller.state.value.suffixIcon,
                isPassword: controller.state.value.isPassword,
                onPressed: () => controller.toggleObscure(),
                onChanged: (value) =>
                    controller.onChangedPassword(value: '$value'),
                validator: (value) =>
                    Utils.inputValidator('$value', type: Type.password),
              ),
              25.sH,
              TextInputWidget(
                hintText: Kstrings.confirmPassword.tr,
                prefixIcon: Kimage.lockIcon,
                isPassword: controller.state.value.isPasswordConfirm,
                txAction: TextInputAction.done,
                suffixIcon: controller.state.value.suffixIconConfirm,
                onChanged: (value) =>
                    controller.onChangedPasswordConfirm(value: '$value'),
                onPressed: () => controller.toggleObscureConfirm(),
                validator: (value) => Utils.inputValidator(
                  '$value',
                  // type: Type.passwordConfirm,
                  val: controller.state.value.password,
                ),
              ),
              25.sH,
              BtnWidget(
                title: Kstrings.signUp.tr,
                rx: controller.state.value.rx,
                onTap: () => controller.register(),
              ),
              Padding(
                padding: gPadding(left: 10, right: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Kstrings.haveAccAlready.tr,
                      style: gStyle16(fontWeight: FontWeight.w700),
                    ),
                    5.sW,
                    TxtBtn(
                      Text(
                        Kstrings.login.tr,
                        style: gStyle16(
                          color: KColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTap: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
