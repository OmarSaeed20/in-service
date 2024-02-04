import 'package:in_service/index.dart';

snackBarMessage({required String msg, String? title}) {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  }
  bool isWifiError = msg.valide().contains("No internet connection".tr);
  Get.showSnackbar(
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 6000),
      backgroundColor: KColors.black,
      leftBarIndicatorColor: KColors.red,
      margin: EdgeInsets.all(3.w),
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 2.w),
      icon: Icon(
        isWifiError ? Icons.wifi_find_rounded : Icons.warning_outlined,
        // CupertinoIcons.exclamationmark_bubble,
        // color: KColors.pointsColo,
        size: 3.2.h,
      ),
      titleText: !isWifiError
          ? Text(
              title ?? Kstrings.alert.tr,
              style:
                  gStyle14(fontWeight: FontWeight.w700, color: KColors.white),
            )
          : null,
      messageText: Text(
        msg.isEmptyOrNul ? Kstrings.somethingWrong.tr : msg,
        style: gStyle12(color: KColors.white),
      ),
    ),
  );
}
