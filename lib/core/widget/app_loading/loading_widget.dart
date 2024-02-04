import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/index.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.valueColor = KColors.white,
    this.color = KColors.primary,
  });
  final Color color;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: KColors.primary,
        // leftDotColor: KColors.green,
        // rightDotColor: KColors.blueB,
        size: context.height * .1,
      ),
      /*  LoadingAnimationWidget.discreteCircle(
        color: KColors.primary,
        secondRingColor: KColors.green,
        thirdRingColor: KColors.blueB,
        size: context.height * .1,
      ), */
      /* CircularProgressIndicator.adaptive(
        backgroundColor: color,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ), */
    );
  }
}
class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2({
    super.key,
    this.valueColor = KColors.white,
    this.color = KColors.primary,
    this.strokeWidth = 4.0,
  });
  final Color color, valueColor;
  final double strokeWidth;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color,
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
