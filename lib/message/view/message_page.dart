part of 'view.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});
  static Route<MessagePage> route() => MaterialPageRoute(
        builder: (context) => const MessagePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const MessageView();
  }
}
