import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/image_text_container.dart';

class PropertyOffersWidget extends StatelessWidget {
  const PropertyOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<PropertyOffers> propertyOffers = [
      const PropertyOffers(
        title: 'Wheelchair Accessible',
        assetIcons: AssetIcons.wheelchair_icon,
      ),
      const PropertyOffers(
        title: 'Furnished',
        assetIcons: AssetIcons.furnished_icon,
      ),
      const PropertyOffers(
        title: 'Elevator',
        assetIcons: AssetIcons.elevator_icon,
      ),
      const PropertyOffers(
        title: 'No Smoking',
        assetIcons: AssetIcons.no_smoking_icon,
      ),
      const PropertyOffers(
        title: 'AC',
        assetIcons: AssetIcons.ac_icon,
      ),
      const PropertyOffers(
        title: 'Swimming Pool',
        assetIcons: AssetIcons.swimming_pool_icon,
      ),
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
      ),
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final propertyOffer = propertyOffers[index];
        return ImageTextContainer(
          title: propertyOffer.title,
          assetIcons: propertyOffer.assetIcons,
        );
      },
    );
  }
}

class PropertyOffers {
  const PropertyOffers({
    required this.title,
    required this.assetIcons,
  });

  final String title;
  final AssetIcons assetIcons;
}
