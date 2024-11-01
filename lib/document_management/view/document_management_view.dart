part of 'view.dart';

class DocumentManagementView extends StatelessWidget {
  const DocumentManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'My Documents',
        actions: [
          GestureDetector(
            onTap: () {
              // context.push(NotificationPage.route());
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
      body: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTitleSubtitle(
                title: 'Signed Contracts',
                subtitle: 'All of your signed contracts are available here.',
              ),
            ),
            CustomTabBar(
              tabs: [
                'Signed Contracts',
                'Inspection Reports',
                'Payment Receipts',
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SignedContractsWidget(),
                  InspectionReportWidget(),
                  PaymentReceiptWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
