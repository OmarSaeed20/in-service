import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:in_service/index.dart';

class SelectImagesCard extends StatelessWidget {
  const SelectImagesCard({
    super.key,
    required this.title,
    this.subTitle,
    this.image,
    this.selectCallback,
    this.cancelCallback,
    this.isError = false,
  });
  final String title;
  final String? subTitle;
  final File? image;
  final VoidCallback? selectCallback, cancelCallback;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.tr,
              style: gStyle14(
                fontWeight: FontWeight.w500,
                color: isError ? Colors.red.shade800 : KColors.textColor,
              ),
            ),
            if (image != null)
              ImageWidget(
                path: Kimage.cancel,
                onTap: cancelCallback,
                height: 16,
                color: KColors.red,
              ),
          ],
        ),
        15.sH,
        InkWell(
          onTap: selectCallback,
          child: DottedBorder(
            strokeWidth: 1.5.w,
            dashPattern: const [8],
            radius: 8.radiusCircular,
            color: isError ? Colors.red.shade800 : KColors.primary,
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: 10.radius),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                padding: image != null
                    ? gPadding()
                    : gPaddingSymmetric(vertical: 45),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isError
                      ? KColors.red.withOpacity(0.075)
                      : const Color(0xFFF5F5F5),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    constraints: !(image != null)
                        ? const BoxConstraints()
                        : BoxConstraints(
                            maxHeight: context.height / 3,
                            maxWidth: double.infinity,
                          ),
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.fill)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidget(
                                path: Kimage.gallery,
                                height: 50,
                                width: 50,
                                color: isError
                                    ? KColors.redError
                                    : KColors.secondaryLight,
                              ),
                              4.sH,
                              Text(
                                subTitle ?? Kstrings.addImage.tr.toLowerCase(),
                                textAlign: TextAlign.center,
                                style: gStyle12(color: KColors.textGray),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
