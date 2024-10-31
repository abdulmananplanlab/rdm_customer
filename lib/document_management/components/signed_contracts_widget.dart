import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/search_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/view/listing_page.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';
import 'package:rdm_builder_customer/widgets/horizontal_spacing.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class SignedContractsWidget extends StatelessWidget {
  const SignedContractsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 28),
            SearchWidget(),
            VerticalSpacing(),
            SignedContractsListWidget(),
          ],
        ),
      ),
    );
  }
}

class SignedContractsListWidget extends StatelessWidget {
  const SignedContractsListWidget({
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
                          text: 'Purchased',
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
                        title: 'Purchase Amount',
                        titleStyle: context.sixteen400,
                        trailing: Text(
                          '\$2,500,000',
                          style: context.sixteen400,
                        ),
                      ),
                      CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Date',
                        titleStyle: context.sixteen400,
                        trailing: Text(
                          '23 Dec, 2023',
                          style: context.sixteen400,
                        ),
                      ),
                      CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Agreement',
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
