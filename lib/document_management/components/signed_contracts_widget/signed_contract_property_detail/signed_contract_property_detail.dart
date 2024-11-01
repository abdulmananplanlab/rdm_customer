import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/signed_contracts_widget/signed_contract_property_detail/property_detail.dart';
import 'package:rdm_builder_customer/widgets/base_scaffold.dart';

class SignedContractPropertyDetail extends StatelessWidget {
  const SignedContractPropertyDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'Property Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: SignedPropertyDetail(),
        ),
      ),
    );
  }
}
