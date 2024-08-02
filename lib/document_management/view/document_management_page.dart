part of 'view.dart';

class DocumentManagementPage extends StatelessWidget {
  const DocumentManagementPage({super.key});
  static Route<DocumentManagementPage> route() => MaterialPageRoute(
        builder: (context) => const DocumentManagementPage(),
      );
  @override
  Widget build(BuildContext context) {
    return const DocumentManagementView();
  }
}
