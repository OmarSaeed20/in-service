import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:in_service/index.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: 10.radius),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: gPaddingAll(20),
        child: SizedBox(
          width: context.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_location_alt_rounded,
                color: KColors.blueB,
                size: 50,
              ),
              20.sH,
              Text(
                'you denied location permission'.tr,
                textAlign: TextAlign.center,
                style: gStyle20(),
              ),
              20.sH,
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: 10.radius,
                          side: BorderSide(
                              width: 2, color: Theme.of(context).primaryColor),
                        ),
                        minimumSize: const Size(1, 45),
                      ),
                      child: Text('close'.tr),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  10.sW,
                  Expanded(
                    child: BtnWidget(
                      title: 'settings'.tr,
                      onTap: () async {
                        await Geolocator.openAppSettings();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
