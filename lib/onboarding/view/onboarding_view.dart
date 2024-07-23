part of 'view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          OnBoardingView(),
        ],
      ),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardController = OnboardingData.onboardingItems;
    final PageController pageController = PageController();
    final cubit = context.read<OnBoardingCubit>();

    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, currentIndex) {
        return PageView.builder(
          controller: pageController,
          onPageChanged: (value) {
            cubit.setPage(value);
          },
          itemCount: onboardController.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        onboardController[currentIndex].image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.10,
                  right: 0,
                  left: 0,
                  child: const AssetIcon.multicolor(
                    AssetIcons.app_logo,
                    size: 44,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    width: double.infinity,
                    height: currentIndex == 2
                        ? MediaQuery.of(context).size.height * 0.42
                        : MediaQuery.of(context).size.height * 0.40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      child: Column(
                        children: [
                          Text(
                            onboardController[currentIndex].title,
                            style: context.twentyFour600,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            onboardController[currentIndex].description,
                            style:
                                context.sixteen400.withColor(context.grey500),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const BuildDots(),
                          const Spacer(),
                          if (currentIndex == onboardController.length - 1)
                            Column(
                              children: [
                                CustomElevatedButton.expanded(
                                  text: 'Let’s Get Started',
                                  onPressed: () {
                                    context
                                        .read<AuthRepository>()
                                        .updateOnboarding(true);
                                    //context.go(SignUpPage.route());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<SignUpPage>(
                                        builder: (context) =>
                                            const SignUpPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                RichTextWidget(
                                  title: 'Already have an account? ',
                                  titleStyle: context.sixteen400
                                      .withColor(context.grey500),
                                  colorTitle: 'Sign In',
                                  colorTitleStyle: context.sixteen500
                                      .withColor(context.primary500),
                                  onTap: () {
                                    // context
                                    //     .read<AuthRepository>()
                                    //     .updateOnboarding(true);
                                    // context.go(LoginPage.route());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<LoginPage>(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          else
                            NavigationButtons(
                              pageController: pageController,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class BuildDots extends StatelessWidget {
  const BuildDots({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((OnBoardingCubit cubit) => cubit.state);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                currentIndex == index ? context.primary500 : context.primary100,
          ),
          height: 7,
          width: currentIndex == index ? 16 : 7,
          duration: const Duration(milliseconds: 700),
        ),
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            pageController.jumpToPage(2);
          },
          child: Text(
            'Skip',
            style: context.sixteen500.withColor(context.primary500),
          ),
        ),
        CustomElevatedButton(
          text: 'Next',
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          padding: const EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 12,
          ),
        ),
      ],
    );
  }
}
