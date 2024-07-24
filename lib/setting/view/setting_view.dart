part of 'view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
      ),
      body: Column(
        children: [
          const NotificationWidget(),
          const VerticalSpacing(of: 24),
          Divider(color: context.grey200),
          const VerticalSpacing(of: 24),
          const GeneralWidget(),
        ],
      ),
    );
  }
}
