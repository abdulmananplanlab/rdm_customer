import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/offer_management/components/pending_widget/pending_detail_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_dot_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_horizatal_text_row.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';
import 'package:rdm_builder_customer/widgets/horizontal_spacing.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class PendingWidget extends StatelessWidget {
  const PendingWidget({
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
              MaterialPageRoute<void>(
                builder: (_) => const PendingDetailWidget(),
              ),
            );
          },
          child: CustomSideBorderWidget(
            margin: const EdgeInsets.only(bottom: 16),
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
                          disabledBackgroundColor: context.warning500,
                          disabledForegroundColor: context.white,
                          borderRadius: 6,
                          height: 25,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          textStyle: context.twelve500,
                          text: 'Pending',
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
                const VerticalSpacing(of: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [
                      CustomHorizontalTextRow(
                        leadingChild: Text(
                          '\$1,250,000',
                          style:
                              context.sixteen600.withColor(context.success500),
                        ),
                        trailingChild: Row(
                          children: [
                            const CustomDotContainer(),
                            const SizedBox(width: 11),
                            Text(
                              'For Sale',
                              style:
                                  context.twelve400.withColor(context.grey300),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpacing(),
                      Text(
                        '429 HERITAGE DR, FORT MURRAY AB T9 1S4, New York',
                        style: context.sixteen600,
                      ),
                      const VerticalSpacing(),
                      CustomListTile(
                        width: 8,
                        titleStyle:
                            context.sixteen400.withColor(context.grey500),
                        subtitleStyle: context.sixteen400,
                        leading: ClipRRect(
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
                        title: 'Host',
                        subtitle: 'James Smith',
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
                const VerticalSpacing(of: 16),
                Divider(
                  color: context.grey300,
                  height: 0,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.primary50,
                    ),
                    child: CustomHorizontalTextRow(
                      leadingTitle: 'Your Offer',
                      trailingChild: Text(
                        '\$1,250,000',
                        style: context.sixteen600.withColor(context.success500),
                      ),
                    ),
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
