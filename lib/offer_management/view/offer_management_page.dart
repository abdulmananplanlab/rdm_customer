part of 'view.dart';

class OfferManagementPage extends StatelessWidget {
  const OfferManagementPage({super.key});

  static Route<OfferManagementPage> route() => MaterialPageRoute(
        builder: (context) => const OfferManagementPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const OfferManagementView();
  }
}
