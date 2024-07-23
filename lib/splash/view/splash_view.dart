part of 'view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool showImage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showImage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      // body: AnimatedCrossFade(
      //   duration: const Duration(milliseconds: 1500),
      //   //firstCurve: const Cubic(-0.68, -0.55, 0.265, 1.55),
      //   //sizeCurve: const Cubic(0.68, -0.55, 0.265, 1.55),
      //   crossFadeState:
      //       showImage ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      //   firstChild: SizedBox(
      //     height: context.screenHeight,
      //     width: context.screenWidth,
      //   ),
      //   secondChild: Image.asset(
      //     AssetImages.splash_background(),
      //   ),
      // ),
      body: Image.asset(
        'assets/animation/splash.gif',
        fit: BoxFit.cover,
        height: context.screenHeight,
        width: context.screenHeight,
      ),
    );
  }
}
