part of 'view.dart';

class ScheduleVisitView extends StatelessWidget {
  const ScheduleVisitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'Schedule a Visit',
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const NotificationPage(),
                ),
              );
            },
            child: const AssetIcon.monotone(AssetIcons.alert),
          ),
        ],
      ),
      body: ScheduleVisitBody(),
    );
  }
}
