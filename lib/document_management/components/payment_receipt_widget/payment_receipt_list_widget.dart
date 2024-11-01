import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/payment_receipt_widget/payment_receipt_property_detail/payment_receipt_property_detail.dart';
import 'package:rdm_builder_customer/widgets/custom_horizatal_text_row.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

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
        return CustomSideBorderWidget(
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
                  trailingStyle: context.sixteen400.withColor(context.grey500),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentReceiptPropertyDetail(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
