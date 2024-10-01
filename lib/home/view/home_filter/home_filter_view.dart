import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/tab_bar_widget.dart';
import 'package:rdm_builder_customer/widgets/base_scaffold.dart';

class HomeFilterScreen extends StatelessWidget {
  const HomeFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> bedrooms = ['Studio', '1', '2', '3', '4', '5', '6'];
    List<String> bathrooms = ['1', '2', '3', '4', '5', '6'];
    List<String> propertyTypes = const [
      'Apartment',
      'Condos',
      'Townhome',
      'Single Family',
      'Multi-Family',
    ];
    List<String> priceRange = const [
      '\$100K+',
      '\$350K+',
      '\$500K+',
      '\$1M+',
      '\$3M+',
    ];

    return BaseScaffold(
      appBar: const CustomAppBar(
        title: 'Filters',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TabBarWidget(
                    firstTab: 'Buy',
                    secondTab: 'Rent',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterBedroomWidget(bedrooms: bedrooms),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      FilterBathroomWidget(bathrooms: bathrooms),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      FilterPropertyWidget(propertyTypes: propertyTypes),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      FilterPriceWidget(priceRange: priceRange),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const ClearFilterButton(),
          const ShowResultButton(),
        ],
      ),
    );
  }
}

class ShowResultButton extends StatelessWidget {
  const ShowResultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
      child: CustomElevatedButton.expanded(
        text: 'Show 100+ results',
        onPressed: () {},
      ),
    );
  }
}

class ClearFilterButton extends StatelessWidget {
  const ClearFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton.expanded(
        isSpacer: true,
        borderColor: context.transparent,
        foregroundColor: context.error500,
        text: 'Clear Filters',
        leading: const AssetIcon.multicolor(AssetIcons.red_cross_mark),
        onPressed: () {},
        borderRadius: 0.0);
  }
}

class FilterPriceWidget extends StatelessWidget {
  const FilterPriceWidget({
    super.key,
    required this.priceRange,
  });

  final List<String> priceRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range',
              style: context.sixteen500.withColor(context.grey900)),
          const SizedBox(
            height: 16,
          ),
          ChipWidget(
            addedChips: priceRange,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class FilterPropertyWidget extends StatelessWidget {
  const FilterPropertyWidget({
    super.key,
    required this.propertyTypes,
  });

  final List<String> propertyTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Type',
              style: context.sixteen500.withColor(context.grey900)),
          const SizedBox(
            height: 16,
          ),
          ChipWidget(
            addedChips: propertyTypes,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class FilterBathroomWidget extends StatelessWidget {
  const FilterBathroomWidget({
    super.key,
    required this.bathrooms,
  });

  final List<String> bathrooms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bathrooms',
              style: context.sixteen500.withColor(context.grey900)),
          const SizedBox(
            height: 16,
          ),
          ChipWidget(
            addedChips: bathrooms,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class FilterBedroomWidget extends StatelessWidget {
  const FilterBedroomWidget({
    super.key,
    required this.bedrooms,
  });

  final List<String> bedrooms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bedrooms',
              style: context.sixteen500.withColor(context.grey900)),
          const SizedBox(
            height: 16,
          ),
          ChipWidget(
            addedChips: bedrooms,
          ),
        ],
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.addedChips,
  });

  final List<String> addedChips;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: addedChips.map((items) {
        return Chip(
          labelStyle: context.sixteen400.withColor(context.grey900),
          side: BorderSide(color: context.grey200),
          backgroundColor: context.transparent,
          label: Text(items),
        );
      }).toList(),
    );
  }
}
