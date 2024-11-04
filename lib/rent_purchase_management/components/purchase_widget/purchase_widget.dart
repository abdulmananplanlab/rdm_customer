import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/offer_management/components/accepted_widget/accepted_detail_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';
import 'package:rdm_builder_customer/widgets/horizontal_spacing.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class PurchaseWidget extends StatelessWidget {
  const PurchaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AcceptedDetailWidget(),
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
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) => AnimatedContainer(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: 1 == index
                                    ? context.white
                                    : context.grey200,
                              ),
                              height: 1 == index ? 9 : 6,
                              width: 1 == index ? 9 : 6,
                              duration: const Duration(milliseconds: 700),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 10,
                        child: CustomElevatedButton(
                          borderColor: Colors.transparent,
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
                              borderColor: Colors.transparent,
                              borderRadius: BorderRadius.zero,
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(4),
                              color: context.grey10.withOpacity(0.5),
                              child: Text(
                                '1 / 20',
                                style: context.ten400.withColor(context.white),
                              ),
                            ),
                            const HorizontalSpacing(of: 8),
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
                      CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Review',
                        titleStyle: context.sixteen400,
                        trailing: Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: context.yellow,
                              size: 30,
                            ),
                            HorizontalSpacing(of: 4),
                            Text(
                              '3.5',
                              style: context.sixteen400,
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
