import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/offer_management/components/component.dart';
import 'package:rdm_builder_customer/widgets/custom_tab_bar.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

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
            controller: _tabController,
            tabs: ['Accepted', 'Pending', 'Rejected'],
          ),
          const VerticalSpacing(of: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AcceptedWidget(),
                  PendingWidget(),
                  RejectedWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
