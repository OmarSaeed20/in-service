import 'package:in_service/core/widget/button/button_animation.dart';

import '/index.dart';
import 'widget/account_reve_card.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AccountAppBar(),
      body: ListView(
        // padding: gPaddingSymmetric(horizontal: 18),
        children: const [
          _UserDataCard(),
          _BuildMobileBody(),
          _BuildReveBody(),
        ],
      ),
    );
  }
}

class _UserDataCard extends StatelessWidget {
  const _UserDataCard();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: gPaddingSymmetric(horizontal: 18),
      child: Text(
        "حمد الخلف",
        textAlign: TextAlign.right,
        style: gStyle20(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _BuildMobileBody extends StatelessWidget {
  const _BuildMobileBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPaddingSymmetric(vertical: 30),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(width: .5, color: KColors.primary),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: 10.radiusCircular,
          bottomLeft: 10.radiusCircular,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: gPadding(
                right: 12,
                bottom: 15,
                left: 8,
                top: 12,
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
                    Kimage.mobile,
                    // ignore: deprecated_member_use
                    color: KColors.white,
                  ),
                  4.sW,
                  Text(
                    Kstrings.mobileNumber.tr,
                    overflow: TextOverflow.ellipsis,
                    style: gStyle14(
                      fontSize: 15,
                      color: KColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                "+974 0000 0000",
                textAlign: TextAlign.center,
                style: gStyle14(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildReveBody extends StatelessWidget {
  const _BuildReveBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(width: .5, color: KColors.primary),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: 10.radiusCircular,
          bottomLeft: 10.radiusCircular,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: gPadding(bottom: 50),
              padding: gPadding(
                right: 12,
                bottom: 15,
                left: 8,
                top: 12,
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
                    Kimage.list,
                    // ignore: deprecated_member_use
                    color: KColors.white,
                  ),
                  4.sW,
                  Text(
                    "التعاقدات",
                    overflow: TextOverflow.ellipsis,
                    style: gStyle14(
                      fontSize: 15,
                      color: KColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            6.sH,
            const ContractsCard(),
          ],
        ),
      ),
    );
  }
}

class _AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AccountAppBar();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      leading: const SizedBox.shrink(),
      leadingWidth: 10,
      title: Text(
        Kstrings.welcome.tr,
        style: gStyle14(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: KColors.primary,
        ),
      ),
      actions: [
        ButtonAnimation(
          onTap: () => Get.toNamed(Routes.editAccount),
          child: Text(
            Kstrings.accountS.tr,
            style: gStyle14(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        7.sW,
        ButtonAnimation(
          onTap: () => Get.toNamed(Routes.editAccount),
          child: SvgPicture.asset(
            Kimage.settingIcon,
            colorFilter: ColorFilter.mode(
              isDarkMode(context) ? KColors.white : KColors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        10.sW,
      ],
    );
  }
}
