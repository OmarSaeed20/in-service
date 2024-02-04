import 'package:in_service/core/util/utils.dart';

import '/index.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: gPaddingSymmetric(vertical: 44),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Kstrings.rememberYourPassword.tr,
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
      appBar: AppBar(
          title: Text(
        Kstrings.forgetPassword.tr,
        style: gStyle20(fontWeight: FontWeight.w500),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: gPaddingSymmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Kimage.logoPng),
              SvgPicture.asset(Kimage.inService),
              55.sH,
              const _ForgetPasswordBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgetPasswordBody extends GetView<ForgetPasswordControllerImp> {
  const _ForgetPasswordBody();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
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
            BtnWidget(
              title: Kstrings.send.tr,
              margin: gPadding(top: 24, bottom: 45),
              rx: controller.state.value.rx,
              onTap: () => controller.setEmailAddress(),
            ),
          ],
        ),
      ),
    );
  }
}
