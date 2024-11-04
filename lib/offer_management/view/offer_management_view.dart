part of 'view.dart';

class OfferManagementView extends StatelessWidget {
  const OfferManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'Offer Management',
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
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: AssetIcon.monotone(AssetIcons.menu),
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: OfferManagementViewBody(),
    );
  }
}
