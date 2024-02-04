import 'package:in_service/core/widget/handling_view_widgets/list_empty_card.dart';

import '/index.dart';
import 'loading_state_widget.dart';

class HandlingRequstView extends StatelessWidget {
  const HandlingRequstView(
    this.rx, {
    super.key,
    required this.child,
    this.loading,
    this.onTap,
    this.title,
    this.sub,
    this.image,
    this.padding,
  });
  final RequestState rx;
  final Widget? loading;
  final String? title, sub, image;
  final Widget child;
  final EdgeInsetsDirectional? padding;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) => switch (rx) {
        RequestState.loading => loading ?? const Center(child: LoadingBody()),
        // loading ?? Center(child: LoadingStateWidget(rx: rx)),
        RequestState.offLineFailure => Padding(
            padding: padding ?? gPadding(),
            child: Center(child: OfflineInterNetWidget(onTap: onTap, rx: rx)),
          ),
        RequestState.empty => Center(
            child: ListEmptyCard(
              icon: image ?? Kimage.empty,
              title: title.valide(),
              subtitle: sub.valide(),
              onTap: onTap ?? () {},
            ),
          ),
        /*  Padding(
            padding: padding ?? gPadding(),
            child: Center(
              child: CustomBageStateWidget(
                image: image,
                rx: rx,
                title: title.valide(),
                supTitle: sub.valide(),
              ),
            ),
          ), */
        _ => child
      };
}

/* class NoDataWidget extends StatelessWidget {
  final String? image;
  final Size imageSize;
  final BoxFit fit;
  final Widget? imageWidget;

  final String? title, subTitle, retryText;
  final TextStyle? titleTextStyle, subStyle;
  final VoidCallback? onRetry;
  final EdgeInsets? buttonPadding, buttonMargin;

  const NoDataWidget({
    this.image,
    this.imageSize = const Size(50, 50),
    this.imageWidget,
    this.fit = BoxFit.contain,
    this.title,
    this.subTitle,
    this.onRetry,
    this.retryText,
    this.titleTextStyle,
    this.subStyle,
    this.buttonPadding,
    this.buttonMargin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageWidget(),
        if (title.valide().isNotEmpty)
          Text(
            title,
            style: titleTextStyle ?? gStyle16(),
            textAlign: TextAlign.center,
          ).paddingTop(16),
        if (subTitle.valide().isNotEmpty)
          Text(
            subTitle,
            style: subStyle ?? gStyle14(color: KColors.textSecondaryColor),
            textAlign: TextAlign.center,
          ).paddingTop(4),
        if (onRetry != null)
          GButton(
            title: retryText ?? 'Reload'.tr,
            margin: buttonMargin ?? gPaddingAll(16),
            onTap: onRetry,
            textColor: white,
            padding: buttonPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          ),
      ],
    ).center();
  }

  Widget _imageWidget() {
    if (imageWidget != null) return imageWidget!;
    if (image.valide().isEmpty) return const Offstage();

    if (image.valide().startsWith('http')) {
      return Image.network(
        image!,
        height: imageSize.height,
        width: imageSize.width,
        fit: fit,
      );
    } else {
      return ImageWidget(
        path: image,
        height: imageSize.height,
        width: imageSize.width,
        fit: fit,
      );
    }
  }
}
 */