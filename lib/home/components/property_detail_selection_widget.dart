import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/property_selection_widget.dart';
import 'package:rdm_builder_customer/home/components/search_by_location_widget.dart';

class PropertyDetailsOptions extends StatelessWidget {
  const PropertyDetailsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            PropertyTypeWidget(),
            SizedBox(
              height: 12,
            ),
            SearchLocationWidget(
              title: 'Location',
            ),
            SizedBox(
              height: 12,
            ),
            SearchPropertiesButton(),
          ],
        ),
      ),
    );
  }
}

class SearchPropertiesButton extends StatelessWidget {
  const SearchPropertiesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
        onPressed: () {}, text: 'Search Properties');
  }
}
