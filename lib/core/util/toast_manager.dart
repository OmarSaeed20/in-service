import '/index.dart';

class ToastManager {
  void showSnak(String? msg, {IconData? icon, bool isSuc = true}) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    bool isWifiError = msg.valide().contains("No internet connection".tr);
    Get.showSnackbar(
      GetSnackBar(
        duration: Duration(seconds: isSuc ? 3 : 5),
        leftBarIndicatorColor:
            isSuc ? Colors.green.shade900 : Colors.red.shade900,
        backgroundColor: isSuc ? KColors.white : KColors.black,
        snackPosition: SnackPosition.TOP,
        margin: gPaddingAll(12),
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 2.w),
        icon: Icon(
          isWifiError
              ? Icons.wifi_2_bar_rounded
              : icon ?? (isSuc ? Icons.check_circle_rounded : Icons.error),
          color: isSuc ? Colors.green.shade900 : Colors.red.shade900,
        ),
        messageText: Text(
          msg.isEmptyOrNul ? Kstrings.somethingWrong.tr : msg.valide(),
          style: gStyle14(color: isSuc ? KColors.textColor : KColors.white),
        ),
      ),
    );
  }
}
