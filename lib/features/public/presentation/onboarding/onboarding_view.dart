import 'package:in_service/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/next_button.dart';
import 'components/onboarding.dart';
import 'components/onboarding_card.dart';
import 'components/skip_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  OnboardingViewState createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView> {
  int _currentPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context). brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDarkMode(context) ? KColors.kDarkBackground : KColors.white,
      appBar: AppBar(
        backgroundColor:
            isDarkMode(context) ? KColors.kDarkBackground : KColors.white,
        actions: [
          SkipButton(
            onTap: () {
              Get.find<AppPreferences>().onSubmittedOnboarding;
              Get.offAllNamed(Routes.login);
            },
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingList.length,
              controller: _pageController,
              // physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) => OnboardingCard(
                playAnimation: true,
                onboarding: onboardingList[index],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: onboardingList.length,
                effect: WormEffect(
                  dotHeight: 6.h,
                  dotWidth: 13.w,
                  activeDotColor: KColors.primary,
                  dotColor: KColors.primary.withOpacity(0.2),
                ),
                onDotClicked: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              NextButton(
                onTap: () {
                  (_currentPageIndex < onboardingList.length - 1)
                      ? {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          )
                        }
                      : {
                          Get.find<AppPreferences>().onSubmittedOnboarding,
                          Get.offAllNamed(Routes.login),
                        };
                },
              ),
            ],
          ),
          75.sH,
        ],
      ),
    );
  }
}
