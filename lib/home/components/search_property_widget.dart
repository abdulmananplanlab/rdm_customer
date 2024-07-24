import 'package:common/common.dart';
import 'package:flutter/material.dart';

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
        const Row(
          children: <Widget>[
            Expanded(
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
            SizedBox(
              width: 8.0,
            ),
            PropertyFilterWidget(),
          ],
        ),
      ],
    );
  }
}

class PropertyFilterWidget extends StatelessWidget {
  const PropertyFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(color: context.grey200)),
          padding: const EdgeInsets.all(12.0),
          child: const AssetIcon.multicolor(AssetIcons.filter_icon)),
    );
  }
}
