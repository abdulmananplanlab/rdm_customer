part of 'view.dart';

class FundsBalancePage extends StatelessWidget {
  const FundsBalancePage({super.key});
  static Route<FundsBalancePage> route() =>
      MaterialPageRoute(builder: (context) => const FundsBalancePage());
  @override
  Widget build(BuildContext context) {
    return const FundsBalanceView();
  }
}
