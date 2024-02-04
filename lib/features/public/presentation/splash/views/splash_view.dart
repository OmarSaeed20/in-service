import '../controllers/splash_controller.dart';
import '/index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      Kimage.in123,
                      height: context.height,
                    ),
                  ),
                  Positioned.fill(
                    top: -350.h,
                    child: Image.asset(
                      Kimage.logoPng,
                      height: 500.h,
                      width: context.width,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                // top: -350.h,
                child: Image.asset(
                  Kimage.backGpng,
                  height: context.height,
                  filterQuality: FilterQuality.high,
                ),
              ),
              /* Positioned.fill(
                child: Column(
                  children: [
                    Image.asset(
                      Kimage.logoPng,
                      height: context.height / 5,
                      filterQuality: FilterQuality.high,
                    ),
                    const ImageWidget(path: Kimage.inService),
                    ex("نعمل من اجل راحتك", color: KColors.blueL),
                    ex("بنظام التعاقد الشهري", color: KColors.primary),
                    ex("خدمات متميزة بأسعار تنافسية", color: KColors.green),
                  ],
                ),
              ),
             */
            ],
          ),
        );
      },
    );
  }

/*   Container ex(String text, {required Color color}) {
    return Container(
      decoration: BoxDecoration(borderRadius: 5.radius, color: color),
      padding: gPaddingSymmetric(horizontal: 13, vertical: 7),
      margin: gPadding(bottom: 12),
      child: Text(
        text,
        style: gStyle14(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: KColors.white,
        ),
      ),
    );
  } */
}
