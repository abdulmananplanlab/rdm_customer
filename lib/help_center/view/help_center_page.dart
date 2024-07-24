part of 'view.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  static Route<HelpCenterPage> route() => MaterialPageRoute(
        builder: (context) => const HelpCenterPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCenterCubit(),
      child: const HelpCenterView(),
    );
  }
}
