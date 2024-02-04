import 'package:in_service/features/main/presentation/main/controllers/main_controller.dart';

import '/index.dart';
import 'widget/bottom_nav_bar_fb5.dart';

class MainView extends GetView<MainControllerImp> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    PageStorageBucket bucket = PageStorageBucket();
    return Obx(
      // ignore: deprecated_member_use
      () => WillPopScope(
        onWillPop: () => controller.onWillPop(context),
        child: Scaffold(
          extendBody: true,
          // appBar: const AppBaar(),
          // drawer: const CustomDrawer(),
          backgroundColor: KColors.scaffoldBackground2,
          body: PageStorage(
            bucket: bucket,
            child: controller.state.value.pages
                .elementAt(controller.state.value.currentIndex),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const _BottomNavigationBar(),
          floatingActionButton: const _FloatingActionButton(),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: ClipRRect(
          borderRadius: 200.radius,
          child: Image.asset(Kimage.logoPng, height: 100),
        ),
      );
}

class _BottomNavigationBar extends GetView<MainControllerImp> {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        elevation: 0,
        padding: gPadding(),
        clipBehavior: Clip.hardEdge,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.w,
        child: Container(
          padding: gPadding(right: 25, left: 25, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: 15.radiusCircular,
              topRight: 15.radiusCircular,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: context.width < 350
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...List.generate(
                controller.state.value.pages.length + 1,
                (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? 15.sW
                      : CustomMaterialButton(
                          text: controller.state.value.titl[i].tr,
                          onTap: () => controller.changePage(index: i),
                          img: controller.state.value.icons1[i],
                          isActive: controller.state.value.currentIndex == i,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
