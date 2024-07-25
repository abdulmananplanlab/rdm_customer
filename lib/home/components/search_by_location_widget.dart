import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/home_filter/home_filter_page.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location',
            style: context.sixteen400.copyWith(color: context.grey900)),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            const Expanded(
              child: CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                hintText: 'Search Property...',
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            PropertyFilterWidget(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeFilterPage();
                }));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class PropertyFilterWidget extends StatelessWidget {
  const PropertyFilterWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(color: context.grey200)),
          padding: const EdgeInsets.all(12.0),
          child: const AssetIcon.multicolor(AssetIcons.filter_icon)),
    );
  }
}