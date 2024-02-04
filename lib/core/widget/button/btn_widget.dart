import '/index.dart';
import 'button_animation.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    this.title,
    required this.onTap,
    this.backgroundColor = KColors.primary,
    this.titleColor = KColors.white,
    this.textStyle,
    this.child,
    this.height = 50,
    // this.width = 335,
    this.radius = 20,
    this.border,
    this.margin,
    this.padding,
    this.rx = RequestState.none,
  });
  final String? title;

  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color titleColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin, padding;
  final double height /* ,width */;
  final double radius;
  final Widget? child;
  final RequestState rx;

  @override
  Widget build(BuildContext context) => ButtonAnimation(
        onTap: rx.isLoading ? () {} : onTap!,
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: margin ?? gPadding(),
          child: Material(
            elevation: 4,
            type: MaterialType.card,
            color: backgroundColor,
            borderRadius: (rx.isLoading ? 200 : radius).radius,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: (/* context.width < 350 ? 44 : */ height).h,
              width: (rx.isLoading ? 60 : context.width - 32).w,
              padding: padding ?? gPadding(),
              curve: Curves.easeInOutExpo,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: border, 
                borderRadius: (rx.isLoading ? 200 : radius).radius,
                color: backgroundColor,
              ),
              child: rx.isLoading ? const LoadingWidget() : _btnBody(),
            ),
          ),
        ),
      );

  Widget _btnBody() => switch (title) {
        null => child!,
        _ => FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title.valide(),
              textAlign: TextAlign.center,
              style: textStyle ??
                  gStyle16(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      };
}
