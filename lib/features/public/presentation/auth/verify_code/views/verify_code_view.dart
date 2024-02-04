import 'package:in_service/core/widget/app_text_field/pin_code_text_field_widget.dart';
import 'package:in_service/core/widget/app_text_field/resend_otp_code_widget.dart';

import '/index.dart';

class VerifyCodeView extends GetView<VerifyCodeControllerImp> {
  const VerifyCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            Kstrings.verify.tr,
            style: gStyle20(fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: controller.state.value.formKey,
            child: ListView(
              padding: gPaddingSymmetric(horizontal: 15),
              children: [
                AuthHeader(
                  title: Kstrings.verifyTitle.tr,
                  supTitle: Kstrings.verifyTitleSup.tr,
                  padLef: 55,
                ),
                Text(
                  controller.state.value.phone,
                  style: gStyle14(color: KColors.primary),
                  // padding: gPadding(bottom: 30, top: 5),
                ),
                PinCodeTextFieldWidget(
                  lenght: 4,
                  onChanged: (value) => controller.onChangedCode(value: value),
                  errorAnimationController:
                      controller.state.value.errorAnimationType!,
                ),
                BtnWidget(
                  title: Kstrings.send.tr,
                  margin: gPadding(top: 25, bottom: 45),
                  rx: controller.state.value.rx,
                  onTap: () => controller.verifyEmail(),
                ),
                ResendOtpCodeWidget(
                  isLoading: controller.state.value.rxResendCode.isLoading,
                  onPressed: controller.state.value.timeCounter != 0
                      ? null
                      : () => controller.resendCode(),
                  timer: controller.state.value.timeCounter == 0
                      ? Kstrings.resendCode.tr
                      : '00:${controller.state.value.timeCounter.toString().padLeft(2, '0')}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
