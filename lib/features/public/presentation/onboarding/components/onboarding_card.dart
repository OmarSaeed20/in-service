import 'package:in_service/core/widget/onboarding_animation.dart';
import 'package:in_service/index.dart';

import 'onboarding.dart';

class OnboardingCard extends StatefulWidget {
  final bool playAnimation;
  final Onboarding onboarding;
  const OnboardingCard(
      {required this.playAnimation, super.key, required this.onboarding});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  Animation<Offset> get slideAnimation => _slideAnimation;
  AnimationController get slideAnimationController => _slideAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.playAnimation) {
      _slideAnimationController.forward();
    } else {
      _slideAnimationController.animateTo(
        1,
        duration: const Duration(milliseconds: 0),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _slideAnimationController =
        OnboardingAnimations.createSlideController(this);
    _slideAnimation =
        OnboardingAnimations.openSpotsSlideAnimation(_slideAnimationController);
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: gPadding(top: 153, right: 38, left: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: gPadding(right: 20, left: 20, bottom: 45),
              child: Image.asset(
                widget.onboarding.image,
                // width: double.maxFinite,
                // fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              widget.onboarding.title.tr,
              style: gStyle24(
                  fontWeight: FontWeight.w700, color: KColors.textPrimary),
              textAlign: TextAlign.start,
            ),
            10.sH,
            Text(
              widget.onboarding.description.tr,
              style: gStyle20(color: KColors.textSecondary),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
