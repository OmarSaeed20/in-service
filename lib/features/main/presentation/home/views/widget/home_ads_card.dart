import 'package:in_service/features/main/domain/entity/vendor_entity.dart';

import '/index.dart';

class HomeAdsCard extends StatelessWidget {
  const HomeAdsCard(this.vendor, {super.key});
  final VendorEntity? vendor;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: gPadding(bottom: 15),
      elevation: 4,
      color: isDarkMode(context) ? KColors.kContentColor : KColors.white,
      surfaceTintColor:
          isDarkMode(context) ? KColors.kContentColor : KColors.white,
      child: Container(
        padding: gPadding(left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: 10.radius,
          border: Border.all(color: KColors.grey2, width: .5.w),
        ),
        child: ClipRRect(
          borderRadius: 10.radius,
          child: Column(
            children: [
              Padding(
                padding: gPaddingSymmetric(vertical: 23),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 173),
                          decoration: BoxDecoration(
                            borderRadius: 10.radius,
                            border: Border.all(color: KColors.primary),
                            image: const DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(Kimage.network),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: gPadding(right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            vendorDetails(
                              img: Kimage.idCard,
                              text1: "الكود",
                              text2: "EA124",
                            ),
                            10.sH,
                            vendorDetails(
                              img: Kimage.userName,
                              text1: "الإسم",
                              text2: "صوفيا",
                            ),
                            10.sH,
                            vendorDetails(
                              img: Kimage.idCard,
                              text1: "العمر",
                              text2: "30",
                            ),
                            10.sH,
                            vendorDetails(
                              img: Kimage.falg,
                              text1: "الجنسية",
                              text2: "اوكرانيا",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: gPadding(bottom: 19),
                child: Row(
                  children: [
                    Expanded(
                      child: BtnWidget(
                        onTap: () => Get.toNamed(Routes.vendorDetailsView),
                        height: 40,
                        margin: gPaddingSymmetric(horizontal: 18),
                        padding: gPaddingSymmetric(horizontal: 15),
                        backgroundColor: KColors.blueL,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Kimage.list,
                              // ignore: deprecated_member_use
                              color: KColors.white,
                            ),
                            10.sW,
                            Text(
                              "تفاصيل",
                              overflow: TextOverflow.ellipsis,
                              style: gStyle14(
                                color: KColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BtnWidget(
                        height: 40,
                        padding: gPaddingSymmetric(horizontal: 15),
                        onTap: () => Get.toNamed(Routes.reservationDetails),
                        margin: gPaddingSymmetric(horizontal: 18),
                        backgroundColor: KColors.green,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Kimage.homeBooking,
                              // ignore: deprecated_member_use
                              color: KColors.white,
                            ),
                            10.sW,
                            Text(
                              "إحجز الأن",
                              overflow: TextOverflow.ellipsis,
                              style: gStyle14(
                                color: KColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget vendorDetails(
    {required String img, required String text1, required String text2}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: 10.radius,
      border: Border.all(width: 0.4.w, color: KColors.primary),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: 10.radius,
          child: Container(
            constraints: const BoxConstraints(minWidth: 80),
            padding: gPadding(right: 4, bottom: 7, left: 10, top: 9),
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
  );
}
