part of 'view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String route() => '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}
