import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/inspection_report_widget/inspection_report_property_detail/property_detail.dart';
import 'package:rdm_builder_customer/widgets/base_scaffold.dart';

class InspectionReportPropertyDetail extends StatelessWidget {
  const InspectionReportPropertyDetail({
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
          child: InspectionPropertyDetail(),
        ),
      ),
    );
  }
}
