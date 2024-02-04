import 'dart:async';

import '/index.dart';

class PinCodeTextFieldWidget extends StatelessWidget {
  const PinCodeTextFieldWidget({
    super.key,
    required this.lenght,
    required this.onChanged,
    required this.errorAnimationController,
  });
  final int lenght;
  final void Function(String) onChanged;
  final StreamController<ErrorAnimationType> errorAnimationController;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: lenght,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.slide,
      textStyle: gStyle14(fontSize: 22),
      onChanged: onChanged,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: 5.radius,
        fieldHeight: 50.h,
        fieldWidth: 50.h,
        inactiveBorderWidth: 0.8.w,
        activeColor: KColors.primary,
        inactiveColor: KColors.primary.withOpacity(0.4),
        activeFillColor: KColors.white,
        selectedColor: KColors.primary,
      ),
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      enablePinAutofill: true,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      cursorColor: KColors.blueB,
      errorAnimationController: errorAnimationController,
      appContext: context,
    );
  }
}
