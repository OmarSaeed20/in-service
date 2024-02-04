import '/index.dart';

class IconBt extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double iconSiz;
  final Color iconColor;
  final Color backgroundColor;
  final BorderSide side;
  final int radius;
  final Widget? child;
  final String tooltip;

  const IconBt({
    super.key,
    this.onTap,
    this.icon,
    this.padding,
    this.iconSiz = 18,
    this.iconColor = KColors.white,
    this.backgroundColor = KColors.primary,
    this.side = const BorderSide(width: 0, color: KColors.transparent),
    this.radius = 12,
    this.child,
    required this.tooltip,
    this.margin,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: IconButton.filled(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: radius.radius, side: side),
          ),
          iconColor: MaterialStatePropertyAll(iconColor),
          iconSize: MaterialStatePropertyAll(iconSiz.h),
          padding: MaterialStatePropertyAll(padding ?? gPadding()),
        ),
        tooltip: tooltip,
        onPressed: onTap,
        icon: child ?? Icon(icon),
      ),
    );
  }
}
