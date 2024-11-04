part of 'view.dart';

class RentPurchaseManagementPage extends StatelessWidget {
  const RentPurchaseManagementPage({super.key});
  static Route<RentPurchaseManagementPage> route() => MaterialPageRoute(
        builder: (context) => const RentPurchaseManagementPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const RentPurchaseManagementView();
  }
}
