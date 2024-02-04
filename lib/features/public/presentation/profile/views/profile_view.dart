import 'package:in_service/core/util/utils.dart';

import '/index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<ProfileControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: BuildAppBar(title: Kstrings.accountS.tr),
          body: SingleChildScrollView(
            padding: gPaddingSymmetric(horizontal: 25),
            child: Column(
              children: [
                100.sH,
                TextInputWidget(
                  hintText: Kstrings.userName.tr,
                  fillColor: KColors.transparent,
                  controller: controller.state.value.name,
                  suffixIcon: Kimage.userName,
                ),
                28.sH,
                TextInputWidget(
                  hintText: Kstrings.mobileNumber.tr,
                  prefixIcon: Row(
                    children: [
                      CountryCodePicker(
                        padding: EdgeInsets.zero,
                        onChanged: (value) => controller.onChangedPhone(
                          codeCountry: value.dialCode,
                        ),
                        initialSelection: controller.state.value.codeCountry,
                        favorite: const ["+20"],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      Container(
                        width: 1.w,
                        height: 40.h,
                        color: KColors.greyDark,
                      ),
                    ],
                  ),
                  type: TextInputType.phone,
                  suffixIcon: Icons.phone_iphone_rounded,
                  onChanged: (phone) => controller.onChangedPhone(phone: phone),
                  validator: (value) =>
                      Utils.inputValidator('$value', type: Type.phone),
                ),
                75.sH,
                BtnWidget(onTap: () {}, title: Kstrings.update.tr)
              ],
            ),
          ),
        );
      },
    );
  }
}
