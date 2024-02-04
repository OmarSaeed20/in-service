import '/index.dart';

class ContractsCard extends StatelessWidget {
  const ContractsCard({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: gPadding(bottom: 7.5, right: 20, left: 20),
      elevation: 2,
      color: isDarkMode(context) ? KColors.kContentColor : KColors.white,
      surfaceTintColor:
          isDarkMode(context) ? KColors.kContentColor : KColors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: 10.radius,
          border: Border.all(color: KColors.grey2, width: .5.w),
        ),
        child: ClipRRect(
          borderRadius: 10.radius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // constraints: const BoxConstraints(minHeight: 116, minWidth: 86),
                margin: gPadding(top: 5),
                padding: gPaddingSymmetric(vertical: 5, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: 5.radiusCircular,
                    bottomLeft: 5.radiusCircular,
                  ),
                  color: KColors.primary,
                  border: Border.all(color: KColors.primary),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "عقد ساري",
                      style: gStyle12(
                        fontWeight: FontWeight.w700,
                        color: KColors.white,
                      ),
                    ),
                    7.sW,
                    CircleAvatar(radius: 8.r, backgroundColor: KColors.green),
                  ],
                ),
              ),
              Padding(
                padding: gPadding(top: 11, bottom: 23),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: gPadding(right: 5),
                        constraints:
                            const BoxConstraints(minHeight: 116, minWidth: 86),
                        decoration: BoxDecoration(
                          borderRadius: 10.radius,
                          border: Border.all(color: KColors.primary),
                          image: const DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(Kimage.network2),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: gPadding(right: 5),
                        margin: gPadding(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            _contractsDetails(
                              img: Kimage.idCard,
                              text1: "اسم العاملة",
                              text2: "حسين",
                            ),
                            4.sH,
                            _contractsDetails(
                              img: Kimage.userName,
                              text1: "رقم هاتف العاملة",
                              text2: "+974 0000 0000",
                            ),
                            4.sH,
                            _contractsDetails(
                              img: Kimage.idCard,
                              text1: "تاريخ بدء التعاقد",
                              text2: "1-8-2023",
                            ),
                            4.sH,
                            _contractsDetails(
                              img: Kimage.falg,
                              text1: "تاريخ إنتهاء التعاقد",
                              text2: "30-8-2023",
                            ),
                            4.sH,
                            _contractsDetails(
                              img: Kimage.falg,
                              text1: "قيمة التعاقد",
                              text2: "500 ر.ق",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: gPadding(bottom: 20, right: 5, left: 5),
                child: Column(
                  children: [
                    BtnWidget(
                      onTap: () => Get.toNamed(Routes.vendorDetailsView),
                      height: 40,
                      margin: gPaddingSymmetric(horizontal: 30, vertical: 7.5),
                      padding: gPaddingSymmetric(vertical: 5),
                      backgroundColor: KColors.blueL,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Kimage.list,
                            // ignore: deprecated_member_use
                            color: KColors.white,
                          ),
                          7.sW,
                          Text(
                            "تفاصيل العقد",
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
                    BtnWidget(
                      height: 40,
                      padding: gPaddingSymmetric(vertical: 5),
                      onTap: () {},
                      margin: gPaddingSymmetric(horizontal: 30, vertical: 7.5),
                      backgroundColor: KColors.green,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Kimage.reloadFile,
                            // ignore: deprecated_member_use
                            color: KColors.white,
                          ),
                          10.sW,
                          Text(
                            "طلب تجديد",
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
                    BtnWidget(
                      height: 40,
                      padding: gPaddingSymmetric(vertical: 5),
                      onTap: () {},
                      margin: gPaddingSymmetric(horizontal: 30, vertical: 7.5),
                      backgroundColor: KColors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Kimage.deleteFile,
                            // ignore: deprecated_member_use
                            color: KColors.white,
                          ),
                          10.sW,
                          Text(
                            "طلب إلغاء",
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

Widget _contractsDetails(
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
            constraints: const BoxConstraints(minWidth: 100),
            padding: gPadding(right: 6, bottom: 3, left: 4, top: 4),
            decoration: BoxDecoration(
              borderRadius: 10.radius,
              color: KColors.primary,
            ),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style:
                  gStyle10(color: KColors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Expanded(
          child: Text(
            text2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: gStyle14(fontSize: 11, fontWeight: FontWeight.w700),
          ),
        )
      ],
    ),
  );
}
