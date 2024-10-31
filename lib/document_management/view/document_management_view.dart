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

class InspectionReportWidget extends StatelessWidget {
  const InspectionReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 28),
            SearchInspectionWidget(),
            VerticalSpacing(),
            InspectionReportListWidget(),
          ],
        ),
      ),
    );
  }
}

class PaymentReceiptWidget extends StatelessWidget {
  const PaymentReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 28),
            SearchPaymentWidget(),
            VerticalSpacing(),
            PaymentReceiptListWidget(),
          ],
        ),
      ),
    );
  }
}

class SearchInspectionWidget extends StatelessWidget {
  const SearchInspectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            hintText: 'Search Property...',
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        UpwardDropdownButton(
          options: ['Approved', 'Pending', 'Rejected'],
          initialSelectedValue: 'Status',
        ),
        // CustomDropDownMenu(),
      ],
    );
  }
}

class SearchPaymentWidget extends StatelessWidget {
  const SearchPaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            hintText: 'Search Property...',
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        UpwardDropdownButton(
          options: ['Paid', 'Pending'],
          initialSelectedValue: 'Sort By',
        ),
        // CustomDropDownMenu(),
      ],
    );
  }
}

class InspectionReportListWidget extends StatelessWidget {
  const InspectionReportListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PropertyDetailPage(),
              ),
            );
          },
          child: CustomSideBorderWidget(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            width: 300,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      const NetworkImageWidget(
                        imageUrl:
                            'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      ),
                      Positioned(
                        top: 8,
                        right: 10,
                        child: CustomElevatedButton(
                          disabledBackgroundColor: context.primary500,
                          disabledForegroundColor: context.white,
                          borderRadius: 6,
                          height: 25,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          textStyle: context.twelve500,
                          text: 'Approved',
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 5,
                        child: Row(
                          children: [
                            CustomColorContainer(
                              borderRadius: BorderRadius.zero,
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(4),
                              color: context.grey10.withOpacity(0.5),
                              child: Text(
                                '1 / 20',
                                style: context.ten400.withColor(context.white),
                              ),
                            ),
                            const HorizontalSpacing(
                              of: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [
                      const VerticalSpacing(),
                      Text(
                        '429 HERITAGE DR, FORT MURRAY AB T9 1S4, New York',
                        style: context.sixteen600,
                      ),
                      const VerticalSpacing(),
                      CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Inspection Date',
                        titleStyle: context.sixteen400,
                        trailing: Text(
                          '23 Dec, 2023',
                          style: context.sixteen400,
                        ),
                      ),
                      CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Inspection Report',
                        titleStyle: context.sixteen400,
                        trailing: Row(
                          children: [
                            const AssetIcon.multicolor(AssetIcons.upload_icon),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Download',
                              style: context.sixteen400
                                  .withColor(context.primary500),
                            ),
                          ],
                        ),
                      ),
                      CustomListTile(
                        titleStyle:
                            context.sixteen400.withColor(context.grey500),
                        subtitleStyle: context.sixteen400,
                        leading: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              child: NetworkImageWidget(
                                height: 50,
                                width: 50,
                                imageUrl:
                                    'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              ),
                            ),
                            const Positioned(
                              left: 27.0,
                              bottom: 0.0,
                              child: AssetIcon.multicolor(
                                AssetIcons.verified_circle,
                              ),
                            )
                          ],
                        ),
                        title: 'Inspector',
                        subtitle: 'Edward Mike',
                        trailing: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.primary50,
                            shape: BoxShape.circle,
                          ),
                          child: AssetIcon.monotone(
                            AssetIcons.phone_icon,
                            color: context.primary500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PaymentReceiptListWidget extends StatelessWidget {
  const PaymentReceiptListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: CustomSideBorderWidget(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Column(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.grey50,
                  ),
                  child: CustomHorizontalTextRow(
                    leadingTitle: 'Invoice ID',
                    leadingStyle: context.sixteen600,
                    trailingStyle:
                        context.sixteen400.withColor(context.grey500),
                    trailingTitle: 'R_74829',
                  ),
                ),
              ),
              VerticalSpacing(of: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomHorizontalTextRow(
                      leadingTitle: 'Status',
                      leadingStyle: context.sixteen600,
                      trailingChild: CustomElevatedButton(
                        borderRadius: 6,
                        disabledBackgroundColor: context.primary500,
                        disabledForegroundColor: context.white,
                        text: 'Paid',
                        textStyle: context.twelve500,
                        padding: EdgeInsets.all(0),
                        height: 26,
                      ),
                    ),
                    VerticalSpacing(of: 16),
                    CustomHorizontalTextRow(
                      leadingTitle: 'Date',
                      leadingStyle: context.sixteen600,
                      trailingStyle:
                          context.sixteen400.withColor(context.grey500),
                      trailingTitle: 'May 27, 2023',
                    ),
                    VerticalSpacing(of: 16),
                    CustomHorizontalTextRow(
                      leadingTitle: 'Amount',
                      leadingStyle: context.sixteen600,
                      trailingStyle:
                          context.sixteen400.withColor(context.grey500),
                      trailingTitle: '\$20,000',
                    ),
                    VerticalSpacing(of: 16),
                    CustomHorizontalTextRow(
                      leadingTitle: 'Invoice From',
                      leadingStyle: context.sixteen600,
                      trailingStyle:
                          context.sixteen400.withColor(context.grey500),
                      trailingTitle: 'Realtor',
                    ),
                    VerticalSpacing(of: 16),
                    CustomOutlinedButton.custom(
                      text: 'View Details',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class CustomHorizontalTextRow extends StatelessWidget {
  const CustomHorizontalTextRow({
    super.key,
    required this.leadingTitle,
    this.trailingTitle,
    this.leadingStyle,
    this.trailingStyle,
    this.trailingChild,
  });

  final String leadingTitle;
  final String? trailingTitle;
  final TextStyle? leadingStyle;
  final TextStyle? trailingStyle;
  final Widget? trailingChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingTitle,
          style: leadingStyle ?? context.sixteen400,
        ),
        trailingChild ??
            Text(
              trailingTitle ?? 'No Text',
              style: trailingStyle ?? context.sixteen400,
            ),
      ],
    );
  }
}
