part of 'view.dart';

class ScheduleVisitPage extends StatelessWidget {
  const ScheduleVisitPage({super.key});
  static Route<ScheduleVisitPage> route() => MaterialPageRoute(
        builder: (_) => const ScheduleVisitPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const ScheduleVisitView();
  }
}
