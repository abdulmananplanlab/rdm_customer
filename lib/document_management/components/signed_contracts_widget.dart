import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/document_management/components/search_widget.dart';
import 'package:rdm_builder_customer/home/components/listing_top_container.dart';
import 'package:rdm_builder_customer/home/view/listing_details/view/listing_page.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';
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
                const ListingTopContainer(),
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
