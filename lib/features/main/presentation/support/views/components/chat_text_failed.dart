// ignore_for_file: unused_element

part of 'message_body.dart';

class CardTextFieldContent2 extends GetView<SupportController> {
  const CardTextFieldContent2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: gPadding(bottom: 20, right: 16, left: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: _ChatTextField(
                    fillColor: KColors.highlightColor,
                    hintText: Kstrings.writeHere.tr,
                    controller: controller.state.value.msgCtrl,
                    keyboardType: TextInputType.text,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  padding: gPadding(right: 14),
                  child: FloatingActionButton(
                    onPressed: () => controller.sendMessage(),
                    backgroundColor: KColors.primary,
                    elevation: 4,
                    shape: const CircleBorder(),
                    child: !controller.state.value.rxsend.isLoading
                        ? const ImageWidget(path: Kimage.send)
                        : const LoadingWidget2(strokeWidth: 3.0),
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

class _ChatTextField extends StatelessWidget {
  const _ChatTextField({
    this.prefixIcon,
    this.hintText,
    this.maxLength,
    this.prefixText,
    this.validator,
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.hintStyle,
    this.prefixIconConstraints,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.keyboardType,
    this.fillColor,
    this.borderRadius = 23,
    this.borderColor = const Color(0xffE2E2E2),
  });
  final Widget? prefixIcon, suffixIcon, suffix;
  final String? hintText, prefixText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final BoxConstraints? prefixIconConstraints;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  final Color? fillColor, borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      onTap: onTap,
      keyboardType: keyboardType,
      cursorColor: KColors.primary,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor == null ? false : true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        suffix: suffix,
        hintStyle: hintStyle ?? gStyle16(color: Colors.grey),
        contentPadding: gPaddingSymmetric(horizontal: 12, vertical: 13),
        prefixIcon: prefixIcon,
        prefixText: prefixText ?? "",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius.radius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius.radius,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius.radius,
        ),
      ),
    );
  }
}
