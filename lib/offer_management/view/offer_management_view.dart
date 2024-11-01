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

class OfferManagementViewBody extends StatefulWidget {
  const OfferManagementViewBody({
    super.key,
  });

  @override
  State<OfferManagementViewBody> createState() =>
      _OfferManagementViewBodyState();
}

class _OfferManagementViewBodyState extends State<OfferManagementViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTitleSubtitle(
              title: 'Accepted Offers',
              subtitle: 'All of yor accepted offers are available here.',
            ),
          ),
          CustomTabBar(
            tabs: ['Accepted', 'Pending', 'Rejected'],
          ),
          const VerticalSpacing(of: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
