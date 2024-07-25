import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/heat_water_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_detail_list_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_photos_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_price_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_storage_widgets.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/property_offers_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/rating_widget_bar%20copy.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/unit_pricing_widget.dart';
import 'package:rdm_builder_customer/widgets/base_scaffold.dart';
import 'package:rdm_builder_customer/widgets/custom_border_list_tile.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: CustomAppBar(
        title: 'Property Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: PropertyDetailsWidget(),
        ),
      ),
    );
  }
}

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: NetworkImageWidget(
            height: 220,
            imageUrl:
                'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
        ),
        const SizedBox(height: 10),
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: NetworkImageWidget(
            height: 100,
            imageUrl:
                'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
        ),
        const SizedBox(height: 10),
        const OfferPhotosWidget(),
        const SizedBox(height: 24),
        OfferPriceAndIconWidget(
          titleTextStyle: context.twenty600,
          title: '584B Walnut Cres, Wood Buffalo',
          isTrailing: true,
          trailing: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetIcon.monotone(AssetIcons.share_icon),
              SizedBox(width: 16),
              AssetIcon.monotone(AssetIcons.like_icon),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '584B Walnut Cres, Wood Buffalo, AB T9K 0N6',
          style: context.sixteen400,
        ),
        const SizedBox(height: 8),
        const RatingWidgetBar(),
        const SizedBox(height: 8),
        Row(
          children: [
            AssetIcon.monotone(
              AssetIcons.verified_shield_icon,
              color: context.success500,
            ),
            const SizedBox(width: 8),
            Text(
              'Verified Listing',
              style: context.sixteen400,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const OfferDetailListWidget(
          title: 'Company Name',
          subtitle: 'Realtor',
        ),
        const SizedBox(height: 16),
        const OfferDetailListWidget(
          isLeading: true,
          title: 'Asking Price',
          subtitle: '\$2,000,000',
        ),
        const SizedBox(height: 16),
        const OfferDetailListWidget(
          icon: AssetIcons.bedroom_icon,
          isLeading: true,
          title: 'Bedrooms',
          subtitle: '3 Beds',
        ),
        const SizedBox(height: 16),
        const OfferDetailListWidget(
          icon: AssetIcons.bathroom_icon,
          isLeading: true,
          title: 'Bathrooms',
          subtitle: '2 Baths',
        ),
        const SizedBox(height: 16),
        const OfferDetailListWidget(
          icon: AssetIcons.area_icon,
          isLeading: true,
          title: 'Area',
          subtitle: '5,500 - 6,142 sqft',
        ),
        const SizedBox(height: 24),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        Text(
          'Units Pricing',
          style: context.sixteen600,
        ),
        const SizedBox(height: 16),
        const UnitPricingWidget(
          title: 'City View',
          photos: '41 Photos',
          virtualTours: '3 Virtual Tours',
          video: '3 Videos',
          dollar: '3,750/mo',
          bedroom: '2',
          bathroom: '1',
          area: '6,142 sq ft',
        ),
        const SizedBox(height: 16),
        const UnitPricingWidget(
          title: 'French County',
          photos: '11 Photos',
          virtualTours: '2 Virtual Tours',
          video: '1 Videos',
          dollar: '3,125/mo',
          bedroom: '1',
          bathroom: '1',
          area: '5,500 sq ft',
        ),
        const SizedBox(height: 16),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          title: 'What’s good about this property',
          subtitle:
              "Welcome to this charming suburban home, nestled in a peaceful neighborhood. This 3-bedroom, 2-bathroom residence offers a tranquil retreat for your family. The open-concept living and dining area is perfect for gatherings and entertaining. The modern kitchen features granite countertops and stainless steel appliances. The spacious master suite includes a private en-suite bathroom and walk-in closet. Step into the backyard oasis with a well-maintained garden, a large patio, and a cozy fire pit area. Located near top-rated schools, parks, shopping centers, and with easy access to major highways, this home combines modern comforts with a warm atmosphere. Don't miss the chance to make this your forever home. Schedule a showing today",
        ),
        const SizedBox(height: 24),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'What’s this property offers',
        ),
        const SizedBox(height: 16),
        const PropertyOffersWidget(),
        const SizedBox(height: 16),
        const OfferStorageWidgets(
          title: 'Storage',
          subtitle: 'Loft',
          title1: 'Fitness Center',
          subtitle1: 'Fireplace',
          title2: 'Gated Entry',
          subtitle2: 'Dishwasher',
        ),
        const SizedBox(height: 24),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'This property also has',
        ),
        const SizedBox(height: 16),
        const HeatWaterWidget(),
        const SizedBox(height: 16),
        const OfferStorageWidgets(
          title: 'Gas',
          subtitle: 'Trash Removal',
          title1: 'Sewer',
          subtitle1: 'Cable',
          title2: 'Electricity',
          subtitle2: 'Air Conditioning',
        ),
        const SizedBox(height: 24),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'Parking',
        ),
        const CustomBorderListTile(
          title: 'Surface Lot',
          subtitle: '1 space, Assigned Parking',
          dollarTitle: '140',
        ),
        const SizedBox(height: 16),
        const CustomBorderListTile(
          title: 'Garage',
          subtitle: '1 space, Assigned Parking',
          dollarTitle: '180',
        ),
        const SizedBox(height: 24),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'Allowed Pets',
        ),
        const CustomBorderListTile(
          isAssetIcon: true,
          leading: AssetIcon.monotone(AssetIcons.cat_icon),
          title: 'Garage',
          dollarTitle: '2',
        ),
        const SizedBox(height: 16),
        Divider(
          color: context.grey300,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'Location',
        ),
        const SizedBox(height: 16),
        OfferPriceAndIconWidget(
          titleTextStyle: context.sixteen400,
          title: '584B Walnut Cres, Wood Buffalo',
          isTrailing: true,
          trailing: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetIcon.monotone(
                AssetIcons.direction_icon,
                color: context.primary500,
              ),
              Text(
                'Get Direction',
                style: context.sixteen500.withColor(context.primary500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          fit: BoxFit.cover,
          'assets/map.png',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.32,
        ),
        const SizedBox(height: 24),
        const CustomTitleSubtitle(
          isSubtitle: false,
          title: 'Demographic',
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        // CustomTabBar(
        //   controller: _tabControllerLengthFour,
        //   tabs: const [
        //     'Transit',
        //     'Parks & Recreation',
        //     'Education',
        //     'Food & Drink',
        //   ],
        //   //controller: _tabControllerLengthThree,
        // ),
        // const SizedBox(height: 16),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.9,
        //   child: TabBarView(
        //     controller: _tabControllerLengthFour,
        //     children: const [
        //       TransitWidget(),
        //       TransitWidget(),
        //       TransitWidget(),
        //       TransitWidget(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
