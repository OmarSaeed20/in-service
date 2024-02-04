import '/index.dart';

class ReservationsCard extends StatelessWidget {
  final int index;
  const ReservationsCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationListWidget(
      curve: Curves.easeInOut,
      horizontal: 300,
      index: index,
      milliseconds: 300 + (index * 200),
      child: Material(
        elevation: 2,
        surfaceTintColor: KColors.white,
        color: KColors.white,
        shape: ContinuousRectangleBorder(borderRadius: 30.radius),
        child: ClipRRect(
          borderRadius: 20.radius,
          child: Padding(
            padding: gPaddingAll(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: 85, minWidth: 80),
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "قيد التنفيذ",
                            style: gStyle12(fontWeight: FontWeight.w500),
                          ),
                          6.sW,
                          CircleAvatar(
                            backgroundColor: KColors.green,
                            radius: 10.r,
                          ),
                        ],
                      ),
                      30.sH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: 10.radius,
                                border: Border.all(
                                  width: 0.4.w,
                                  color: KColors.primary,
                                ),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: 10.radius,
                                    child: Container(
                                      padding: gPadding(
                                        top: 6,
                                        bottom: 6,
                                        right: 4,
                                        left: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: 10.radius,
                                        color: KColors.primary,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            Kimage.idCard,
                                            // ignore: deprecated_member_use
                                            color: KColors.white,
                                          ),
                                          4.sW,
                                          Text(
                                            "الكود",
                                            overflow: TextOverflow.ellipsis,
                                            style: gStyle14(
                                              fontSize: 8,
                                              color: KColors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: gPaddingSymmetric(horizontal: 10),
                                    child: Text(
                                      "EA124",
                                      textAlign: TextAlign.center,
                                      style: gStyle14(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // 15.sW,
                          Expanded(
                            // flex: 3,
                            child: BtnWidget(
                              onTap: () =>
                                  Get.toNamed(Routes.vendorDetailsView),
                              height: 30,
                              margin: gPadding(right: 16),
                              padding: gPaddingSymmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              backgroundColor: KColors.blueL,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Kimage.list,
                                    // ignore: deprecated_member_use
                                    color: KColors.white,
                                  ),
                                  3.sW,
                                  Text(
                                    "تفاصيل",
                                    overflow: TextOverflow.ellipsis,
                                    style: gStyle14(
                                      color: KColors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
