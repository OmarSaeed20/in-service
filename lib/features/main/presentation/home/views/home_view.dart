import 'package:in_service/features/main/presentation/home/controllers/home_controller.dart';

import '/index.dart';
import 'widget/drawer/custom_drawer.dart';
import 'widget/home_ads_card.dart';
import 'widget/home_appbar.dart';

class HomeView extends GetView<HomeControllerImp> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeBinding().dependencies();
    return Obx(
      () => Scaffold(
        appBar: const AppBaar(),
        backgroundColor: KColors.scaffoldBackground2,
        drawer: const CustomDrawer(),
        body: HandlingRequstView(
          controller.state.value.rx,
          // loading: const HomeLoadingView(),
          onTap: () => controller.getHome(),
          child: _Body(ctrl: controller),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.ctrl});

  final HomeControllerImp ctrl;

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return SmartRefreshWidget(
      scrCtrl: ctrl.state.value.scrCtrl,
      refCtrl: ctrl.state.value.refCtrl,
      onRefresh: () => ctrl.onRefresh(),
      listenable: listenable,
      child: ListView(
        padding: gPadding(top: 15),
        children: [
          /* Stack(
            children: [
              Text(
                Kstrings.homeSup.tr,
                style: gStyle14(color: KColors.textGray2),
              ),
              Positioned(
                top: -5,
                right: 0,
                child: RefReshBody(listenable: listenable),
              ),
            ],
          ),
 */

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...[
                Visibility(
                  visible: true,
                  child: SliderWidget(
                    images: const [
                      Kimage.network,
                      Kimage.network2,
                      Kimage.network3,
                    ],
                    onPageChanged: (value, _) {},
                    currentIndex: 1,
                  ),
                ),
                36.sH,
                ...[
                  TitleRowWidget(
                    title: "مقدمو الخدمة",
                    padding: gPaddingSymmetric(horizontal: 16),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: gPaddingSymmetric(horizontal: 16),
                    itemBuilder: (BuildContext context, int i) =>
                        const HomeAdsCard(null),
                    itemCount: 3,
                  ),
                  10.sH,
                ],
                40.sH,
              ]
            ],
          )
        ],
      ),
    );
  }
}

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({
    super.key,
    this.trailing = const SizedBox.shrink(),
    required this.title,
    this.padding,
    this.titleStyle,
  });
  final String title;
  final TextStyle? titleStyle;
  final Widget trailing;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      contentPadding: padding ?? gPadding(),
      title: Text(
        title,
        style: titleStyle ??
            gStyle14(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isDarkMode(context) ? KColors.white : KColors.textPrimary,
            ),
      ),
      trailing: trailing,
    );
  }
}
