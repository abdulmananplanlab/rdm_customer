class OnboardingData {
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  static List<OnboardingData> onboardingItems = [
    OnboardingData(
      title: 'Welcome',
      description:
          'Welcome to Realwealtdy, where finding your perfect home is just a click away.',
      image: 'assets/images/1st_onboarding_screen.png',
    ),
    OnboardingData(
      title: 'Redefined Property Search',
      description:
          "We offer an unparalleled property search experience, putting the power in your hands.",
      image: 'assets/images/2nd_onboarding_screen.png',
    ),
    OnboardingData(
      title: 'Your Property, Your Way',
      image: 'assets/images/3rd_onboarding_screen.png',
      description:
          'We\'re your trusted companion in the quest for the perfect property.',
    ),
  ];
}
