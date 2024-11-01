import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/payment_receipt_widget/payment_receipt_list_widget.dart';
import 'package:rdm_builder_customer/document_management/components/payment_receipt_widget/search_payment_widget.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

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
