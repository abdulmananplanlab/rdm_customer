import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/signed_contracts_widget/search_widget.dart';
import 'package:rdm_builder_customer/document_management/components/signed_contracts_widget/signed_contracts_list_widget.dart';
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
