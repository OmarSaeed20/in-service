import 'package:in_service/features/main/presentation/vendor_details/controllers/vendor_details_controller.dart';
import '/index.dart';

import 'components/vendor_details_card.dart';

class VendorDetailsView extends GetView<VendorDetailsControllerImp> {
  const VendorDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const BuildAppBar(title: "تفاصيل"),
      body: Obx(
        () => HandlingRequstView(
          controller.state.value.rx,
          padding: gPadding(bottom: 60),
          child: SingleChildScrollView(
            padding: gPaddingSymmetric(horizontal: 25),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    constraints: BoxConstraints(minHeight: 346.h),
                    decoration: BoxDecoration(
                      borderRadius: 10.radius,
                      border: Border.all(color: KColors.primary),
                      image: const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(Kimage.network),
                      ),
                    ),
                  ),
                ).animate().fadeIn(),
                15.sH,
                const VendorDetailsCard(
                  img: Kimage.idCard,
                  text1: "الكود",
                  text2: "EA124",
                  index: 1,
                ),
                10.sH,
                const VendorDetailsCard(
                  img: Kimage.userName,
                  text1: "الإسم",
                  text2: "صوفيا",
                  index: 2,
                ),
                10.sH,
                const VendorDetailsCard(
                  img: Kimage.idCard,
                  text1: "العمر",
                  text2: "30",
                  index: 3,
                ),
                10.sH,
                const VendorDetailsCard(
                  img: Kimage.quran,
                  text1: "الديانة",
                  text2: "مسلمة",
                  index: 4,
                ),
                10.sH,
                const VendorDetailsCard(
                  img: Kimage.lang2,
                  text1: "اللغة",
                  text2: "الانجليزية",
                  index: 5,
                ),
                10.sH,
                const VendorDetailsCard(
                  img: Kimage.falg,
                  text1: "الجنسية",
                  text2: "اوكرانيا",
                  index: 6,
                ),
                10.sH,
                AnimationListWidget(
                  index: 7,
                  curve: Curves.easeInOutBack,
                  milliseconds: 300 + (7 * 200),
                  horizontal: 300,
                  child: SizedBox(
                    width: context.width,
                    child: Card(
                      elevation: 4,
                      color: isDarkMode(context)
                          ? KColors.kContentColor
                          : KColors.white,
                      surfaceTintColor: isDarkMode(context)
                          ? KColors.kContentColor
                          : KColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: gPadding(bottom: 50),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: 10.radiusCircular,
                                bottomLeft: 10.radiusCircular,
                              ),
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 95),
                                padding: gPadding(
                                  right: 12,
                                  bottom: 7,
                                  left: 10,
                                  top: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: 10.radiusCircular,
                                    bottomLeft: 10.radiusCircular,
                                  ),
                                  color: KColors.primary,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      Kimage.falg,
                                      // ignore: deprecated_member_use
                                      color: KColors.white,
                                    ),
                                    4.sW,
                                    Text(
                                      "الخبرة",
                                      overflow: TextOverflow.ellipsis,
                                      style: gStyle12(
                                        color: KColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BtnWidget(
                  onTap: () => Get.toNamed(Routes.reservationDetails),
                  margin: gPaddingSymmetric(vertical: 40),
                  backgroundColor: KColors.green,
                  title: Kstrings.reservation.tr,
                  textStyle: gStyle24(
                    color: KColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
