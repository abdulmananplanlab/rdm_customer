part of 'view.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static Route<SettingPage> route() => MaterialPageRoute(
        builder: (context) => const SettingPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const SettingView();
  }
}
