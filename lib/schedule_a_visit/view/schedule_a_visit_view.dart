part of 'view.dart';

class ScheduleAVisitView extends StatelessWidget {
  const ScheduleAVisitView({super.key});

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
      body: Column(
        children: [],
      ),
    );
  }
}
