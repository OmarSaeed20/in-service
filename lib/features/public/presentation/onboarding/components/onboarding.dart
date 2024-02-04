import 'package:in_service/index.dart';

class Onboarding extends Equatable {
  final String image, title, description;

  const Onboarding(
      {required this.description, required this.image, required this.title});

  @override
  List<Object> get props => [description, title, image];
}

List<Onboarding> onboardingList = [
  const Onboarding(
    description: Kstrings.onboardingSupText1,
    image: Kimage.onBoarding1,
    title: Kstrings.onboardingText1,
  ),
  const Onboarding(
    description: Kstrings.onboardingSupText2,
    image: Kimage.onBoarding2,
    title: Kstrings.onboardingText2,
  ),
  const Onboarding(
    description: Kstrings.onboardingSupText3,
    image: Kimage.onBoarding3,
    title: Kstrings.onboardingText3,
  ),
  const Onboarding(
    description: Kstrings.onboardingSupText4,
    image: Kimage.onBoarding4,
    title: Kstrings.onboardingText4,
  )
];
