// ignore_for_file: deprecated_member_use

import '/index.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    this.title,
    super.key,
    this.controller,
    this.type,
    this.hintText,
    this.hintStyle,
    this.isPassword = false,
    this.enabled = true,
    this.onChanged,
    this.validator,
    this.textStyle,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.onPressed,
    this.val,
    this.suffixIconColor,
    this.fillColor = KColors.white /* fillColor2 */,
    this.txAction,
    this.maxLines = 1,
    this.radius = 16,
    this.maxLength,
    this.readOnly = false,
    this.callback,
    this.border,
  });
  final TextEditingController? controller;
  final TextInputType? type;
  final String? title, hintText, val;
  final TextStyle? textStyle, hintStyle;
  final Color? prefixColor, fillColor, suffixIconColor;
  final bool isPassword, readOnly, enabled;
  final dynamic prefixIcon, suffixIcon;
  final VoidCallback? onPressed, callback;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? txAction;
  final InputBorder? border;
  final int? maxLines, maxLength, radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!title.isEmptyOrNul) ...[
          Text(' $title'.capitalizFirst(), style: textStyle ?? gStyle14()),
          12.sH,
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: val,
          enabled: enabled,
          controller: controller,
          inputFormatters: type == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          keyboardType: type != TextInputType.number
              ? (type ?? TextInputType.text)
              : null,
          obscureText: isPassword,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: txAction,
          cursorColor: KColors.black,
          style: gStyle14(fontSize: 13, color: KColors.black),
          decoration: InputDecoration(
            contentPadding: gPaddingAll(/* context.width < 350 ? 15 : */ 16),
            hintText: (hintText ?? title).toString().valide().toLowerCase(),
            hintStyle: hintStyle ?? gStyle12(color: KColors.textGray),
            border: border ??
                OutlineInputBorder(
                  borderRadius: radius!.radius,
                  borderSide:
                      BorderSide(width: .5.w, color: KColors.fillBorder),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: radius!.radius,
                  borderSide:
                      BorderSide(width: .5.w, color: KColors.fillBorder),
                ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: radius!.radius,
                  borderSide: BorderSide(width: 1.5.w, color: KColors.primary),
                ),
            filled: true,
            fillColor: fillColor,
            // prefixIconConstraints:
            //     (prefixIcon is Widget) ? BoxConstraints(minWidth: 120.w) : null,
            prefixIcon: (prefixIcon != null)
                ? (prefixIcon is IconData)
                    ? Icon(
                        prefixIcon,
                        size: (/* context.width < 350 ? 15 : */ 18).h,
                        color: prefixColor ?? KColors.primary,
                      )
                    : (prefixIcon is String)
                        ? CircleAvatar(
                            backgroundColor: KColors.transparent,
                            child: ImageWidget(
                              path: prefixIcon,
                              color: prefixColor ?? KColors.primary,
                              height: /*  context.width < 350 ? 15 : */ 20,
                              // width: 20,
                            ),
                          )
                        : SizedBox(
                            width: (context.isTablet ? 120 : 110).w,
                            child: prefixIcon as Widget,
                          )
                : null,
            suffixIcon: (suffixIcon != null)
                ? TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder()),
                    ),
                    onPressed: onPressed,
                    child: (suffixIcon is String)
                        ? CircleAvatar(
                            backgroundColor: KColors.transparent,
                            child: ImageWidget(
                              path: suffixIcon,
                              color: suffixIconColor ?? KColors.primary,
                              height: /*  context.width < 350 ? 15 : */ 20,
                            ),
                          )
                        : Icon(
                            suffixIcon,
                            color: suffixIcon == Icons.phone_iphone_rounded
                                ? KColors.primary
                                : suffixIconColor ?? KColors.grey1,
                          ),
                  )
                : null,
          ),
          readOnly: readOnly,
          onTap: callback,
        ),
      ],
    );
  }

  /* TextButton? _suffixIcon() => switch (suffixIcon) {
        != null => TextButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(CircleBorder()),
            ),
            onPressed: onPressed,
            child: Icon(
              suffixIcon,
              color: suffixIconColor ?? KColors.grey1,
            ),
          ),
        _ => null,
      }; */
}

List<BoxShadow> boxShadow = [
  const BoxShadow(
    color: KColors.grey,
    blurRadius: 10,
    offset: Offset(-2, 2), // changes position of shadow
  ),
];
