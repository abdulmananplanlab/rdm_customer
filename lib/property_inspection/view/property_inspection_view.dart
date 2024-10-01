part of 'view.dart';

class PropertyInspectionScreen extends StatelessWidget {
  const PropertyInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: const CustomAppBar(
          title: 'Earnest Deposit',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const CustomProgressBar(
                        selectedIndex: 4,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Step 4 of 5',
                        style: context.sixteen500.withColor(context.primary500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTitleSubtitle(
                          title: 'Inspection Details',
                          subtitle:
                              'View details of inspections for this property.'),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomSideBorderWidget(
                          radius: BorderRadius.circular(8),
                          width: double.infinity,
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(4),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Inspection Status',
                                    style: context.sixteen400
                                        .withColor(context.grey900),
                                  ),
                                  trailing: CustomElevatedButton(
                                    onPressed: () {},
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    // disabledBackgroundColor:

                                    // borderColor:
                                    //     getColorBasedOnStatus(items.status),
                                    // disabledForegroundColor:
                                    //     getColorBasedOnStatus(items.status),
                                    text: 'Approved',
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Inspection Report',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '\$100',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const HomeProfileListTileWidget(
                                  isVerified: true,
                                  title: 'Inspector',
                                  subTitle: 'William Jack',
                                  imageUrl:
                                      'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Inspection Time:',
                                    style: context.sixteen400
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Text(
                                    '10:30 AM',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Inspection Date:',
                                    style: context.sixteen400
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Text(
                                    'Dec 29,2023',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Report',
                                    style: context.sixteen400
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Row(children: [
                                    const AssetIcon.multicolor(
                                        AssetIcons.upload_icon),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Download Report',
                                      style: context.sixteen400
                                          .withColor(context.primary500),
                                    )
                                  ]),
                                ),
                                CustomElevatedButton.expanded(
                                    text: 'Proceed', onPressed: () {})
                              ],
                            ),
                          )),
                    ])),
              )
            ],
          ),
        ));
  }
}
