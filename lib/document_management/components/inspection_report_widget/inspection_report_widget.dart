import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/inspection_report_widget/inspection_report_list_widget.dart';
import 'package:rdm_builder_customer/document_management/components/inspection_report_widget/search_inspection_widget.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class InspectionReportWidget extends StatelessWidget {
  const InspectionReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 28),
            SearchInspectionWidget(),
            VerticalSpacing(),
            InspectionReportListWidget(),
          ],
        ),
      ),
    );
  }
}
