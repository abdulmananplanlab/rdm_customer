import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/rent_purchase_management/components/components.dart';
import 'package:rdm_builder_customer/widgets/custom_tab_bar.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class RentPurchaseManagementBody extends StatefulWidget {
  const RentPurchaseManagementBody({super.key});

  @override
  State<RentPurchaseManagementBody> createState() =>
      _RentPurchaseManagementBodyState();
}

class _RentPurchaseManagementBodyState extends State<RentPurchaseManagementBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
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
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTitleSubtitle(
              title: _tabController.index == 0
                  ? 'Rent History'
                  : 'Purchase History',
              subtitle: _tabController.index == 0
                  ? 'All of your rented properties are available here.'
                  : 'All of your purchased properties are available here.',
            ),
          ),
          CustomTabBar(
            controller: _tabController,
            tabs: const ['Rented', 'Purchase'],
          ),
          const VerticalSpacing(of: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  RentedWidget(),
                  PurchaseWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
