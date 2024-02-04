// ignore: file_names
import 'dart:io';
import 'dart:ui';

import '/index.dart';

class Utils {
  Utils._();

  static List<String> videoExtensions = [
    'mp4',
    'mkv',
    'avi',
    'mov',
    'flv',
    'webm',
    "3g2",
    "3gp",
    "aaf",
    'asf',
    'm4v',
    'mpeg',
    'mpg',
    'ogv',
    'wmv',
    'gif',
    'avchd',
    'vob',
    'ogg',
    'qt',
    'mts',
  ];
  static isValiedVideo(String? path) {
    if (path.isEmptyOrNul) return false;
    for (var extension in videoExtensions) {
      if (path!.toLowerCase().endsWith('.$extension')) return true;
    }
    return false;
  }

  static String? inputValidator(
    String value, {
    Type type = Type.text,
    bool isCorrectPhone = false,
    String val = '',
  }) {
    if (type == Type.username) {
      if (value.trim().isEmpty) {
        return Kstrings.emptyName.tr;
      }
    }
    if (type == Type.phone) {
      if (value.trim().isEmpty) {
        return Kstrings.emptyMobileNumber.tr;
      }
    }

    if (type == Type.password) {
      if (value.trim().isEmpty) {
        return Kstrings.emptyPassword.tr;
      } else if (value.length < 8) {
        return Kstrings.morePasswordChars.tr;
      }
    }
    if (type == Type.passwordConfirm) {
      if (value.trim().isEmpty) {
        return Kstrings.emptyConfirmPassword.tr;
      } else if (value != val) {
        return Kstrings.matchConfirmPassword.tr;
      }
    }

    if (value.trim().isEmpty) {
      return Kstrings.fieldisRequired.tr;
    } else {
      return null;
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path,
      {required int width, required int height}) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (!await launchUrl(Uri(path: googleUrl))) {
      throw "Could not launch $googleUrl";
    }
  }

  static Future<void> makePhoneCall(String url) async {
    if (!await launchUrl(Uri(path: url))) throw 'Could not launch $url';
  }

  static Future<void> launchWhatsapp(String number) async {
    final url = "https://wa.me/$number?text=";
    if (!await launchUrl(Uri(path: url))) throw 'Could not launch $url';
  }

  // Method to pick picture
  static Future<File?> get pickPicture async {
    final ImagePicker picker = ImagePicker();

    bool? isCamera;

    await Get.dialog(Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Center(
        child: Padding(
          padding: gPaddingSymmetric(horizontal: 24.0),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: 12.radius, color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    color: KColors.primary,
                  ),
                  title: Text('Camera'.tr),
                  onTap: () {
                    isCamera = true;
                    Get.back();
                  },
                ),
                const Divider(height: 1, thickness: 1),
                ListTile(
                  leading:
                      const Icon(Icons.image_outlined, color: KColors.primary),
                  title: Text('Gallery'.tr),
                  onTap: () {
                    isCamera = false;
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
    if (isCamera == null) return null;
    final XFile? image = await picker.pickImage(
        source: isCamera! ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 20);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static void showVerfiySuc() => Get.dialog(
        Dialog(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: 15.radius,
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [KColors.primary, KColors.secondary],
                ),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
            padding: gPaddingSymmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  foregroundColor: KColors.blueB.withOpacity(.4),
                  radius: 25,
                  child: ClipRRect(
                      borderRadius: 25.radius,
                      child: Image.asset(Kimage.logoPng)),
                ),
                15.sH,
                Text(
                  Kstrings.projectName,
                  style: gStyle18(
                    color: KColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                3.5.sH,
                Text(
                  Kstrings.verifySuc.tr,
                  style: gStyle12(
                    color: KColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                15.sH,
              ],
            ),
          ),
        ),
      );

 

  static bool get isRTL {
    final bool isRTL = (Get.locale?.languageCode ?? 'ar') == 'ar';
    return isRTL;
  }

  static TextDirection getDirection(String text) {
    final string = text.trim();
    if (string.isEmpty) return TextDirection.ltr;
    final firstUnit = string.codeUnitAt(0);
    if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
        firstUnit > 0x0750 && firstUnit < 0x077F ||
        firstUnit > 0x07C0 && firstUnit < 0x07EA ||
        firstUnit > 0x0840 && firstUnit < 0x085B ||
        firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
        firstUnit > 0x08E3 && firstUnit < 0x08FF ||
        firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
        firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
        firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
        firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
        firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
        firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
        firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
        firstUnit > 0x10800 && firstUnit < 0x10805 ||
        firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
        firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
        firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
        firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
        firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
        firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
        firstUnit > 0x1D242 && firstUnit < 0x1D244) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  static String getFileType(String link) {
    if (link.isURL) {
      if (link.contains('.document') || link.isDocumentFileName) {
        return 'docx';
      } else if (link.contains('.pdf') || link.isPDFFileName) {
        return 'pdf';
      } else if (link.contains('.m4a') || link.isAudioFileName) {
        return 'm4a';
      } else if (link.isVideoFileName) {
        return 'video';
      } else {
        return 'image';
      }
    } else {
      return 'string';
    }
  }

  static String gJsonString(Map<String, dynamic> json, String chek) =>
      switch (json.containsKey(chek)) {
        true => json[chek] ?? "",
        false => "",
      };
  static int gJsonInt(Map<String, dynamic> json, String chek) =>
      switch (json.containsKey(chek)) {
        true => json[chek] ?? 0,
        false => 0,
      };
}
