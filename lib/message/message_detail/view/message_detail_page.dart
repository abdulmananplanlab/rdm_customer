part of 'view.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key});
  static Route<MessageDetailPage> route() => MaterialPageRoute(
        builder: (context) => const MessageDetailPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const MessageDetailView();
  }
}
