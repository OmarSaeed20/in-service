import '/index.dart';

class VendorDetailsCard extends StatelessWidget {
  const VendorDetailsCard({
    super.key,
    required this.img,
    required this.text1,
    required this.text2,
    required this.index,
  });
  final String img, text1, text2;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return AnimationListWidget(
      index: index,
      curve: Curves.easeInOutBack,
      milliseconds: 200 + (index * 200),
      horizontal: 300,
      child: Card(
        elevation: 4,
        color: isDarkMode(context) ? KColors.kContentColor : KColors.white,
        surfaceTintColor:
            isDarkMode(context) ? KColors.kContentColor : KColors.white,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: 10.radius,
            border: Get.currentRoute == Routes.vendorDetailsView
                ? null
                : Border.all(width: 0.4.w, color: KColors.primary),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: 10.radius,
                child: Container(
                  constraints: BoxConstraints(
                      minWidth: (Get.currentRoute == Routes.vendorDetailsView
                              ? 95
                              : 80)
                          .w),
                  padding: gPadding(right: 12, bottom: 7, left: 10, top: 9),
                  decoration: BoxDecoration(
                    borderRadius: 10.radius,
                    color: KColors.primary,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        img,
                        // ignore: deprecated_member_use
                        color: KColors.white,
                      ),
                      4.sW,
                      Text(
                        text1,
                        overflow: TextOverflow.ellipsis,
                        style: gStyle12(
                            color: KColors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: gStyle12(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ) /* .animate().slideX(
            curve: Curves.easeInOutBack,
            duration: Duration(milliseconds: 300 + (index * 200)),
          ) */
      ,
    );
  }
}
