import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_price_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_check_box.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

class OfferSideBorderWidget extends StatefulWidget {
  const OfferSideBorderWidget({
    super.key,
    this.onPressed,
    this.isAccept = true,
  });
  final void Function()? onPressed;
  final bool isAccept;

  @override
  State<OfferSideBorderWidget> createState() => _OfferSideBorderWidgetState();
}

class _OfferSideBorderWidgetState extends State<OfferSideBorderWidget> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (widget.isAccept)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Offer Details',
                  style: context.sixteen400,
                ),
                const SizedBox(height: 16),
                const OfferPriceAndIconWidget(
                  title: 'Offer Status',
                  subtitle: '\$2,000,000',
                ),
                const SizedBox(height: 20),
                OfferPriceAndIconWidget(
                  subTitleColor: context.primary500,
                  title: 'Active Offer',
                  subtitle: '\$1,500,000',
                ),
                // const HomeProfileListTileWidget(
                //   title: 'Buyer',
                //   subTitle: 'Esther Howard',
                //   imageUrl:
                //       'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                // ),
                const SizedBox(height: 20),
                CustomInkWell(
                  onTap: () {
                    setState(() {
                      isCheck = !isCheck;
                    });
                  },
                  child: CustomCheckBox(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    value: isCheck,
                    onChanged: (value) => setState(() {
                      isCheck = value!;
                    }),
                    child: RichText(
                      text: TextSpan(
                        style: context.sixteen400,
                        text:
                            'I confirm that I have read and understood and I agree to the ',
                        children: [
                          TextSpan(
                            style: context.sixteen600,
                            text: 'Sales Agreement',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        borderColor: context.error500,
                        backgroundColor: context.error50,
                        foregroundColor: context.error500,
                        onPressed: () {},
                        text: 'Reject',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomElevatedButton(
                        text: 'Accept',
                        onPressed: widget.onPressed,
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Offer Details',
                  style: context.sixteen400,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Offer Status',
                      style: context.sixteen400,
                    ),
                    CustomElevatedButton(
                      disabledBackgroundColor: context.primary500,
                      disabledForegroundColor: context.white,
                      text: 'Accepted',
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      enabled: false,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                OfferPriceAndIconWidget(
                  subTitleColor: context.primary500,
                  title: 'Amount',
                  subtitle: '\$1,500,000',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment',
                      style: context.sixteen400,
                    ),
                    CustomElevatedButton(
                      disabledBackgroundColor: context.warning500,
                      disabledForegroundColor: context.white,
                      borderColor: context.warning500,
                      text: 'Pending',
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      enabled: false,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.warning50,
                    border: Border.all(color: context.warning500),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'The Buyer has',
                      style: context.sixteen400,
                      children: [
                        TextSpan(
                          text: ' 3',
                          style: context.sixteen600,
                        ),
                        TextSpan(
                          text: ' days',
                          style: context.sixteen400,
                        ),
                        TextSpan(
                          text: ' : 00',
                          style: context.sixteen600,
                        ),
                        TextSpan(
                          text: ' hr',
                          style: context.sixteen400,
                        ),
                        TextSpan(
                          text: ' : 00',
                          style: context.sixteen600,
                        ),
                        TextSpan(
                          text: ' min left to complete the purchase.',
                          style: context.sixteen400,
                        ),
                      ],
                    ),
                  ),
                ),
                // const HomeProfileListTileWidget(
                //   title: 'Buyer',
                //   subTitle: 'Esther Howard',
                //   imageUrl:
                //       'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                // ),
              ],
            ),
        ],
      ),
    );
  }
}
