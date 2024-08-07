import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/home_filter/home_filter_page.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget(
      {super.key, this.title, this.hintText, this.padding});

  final String? title;
  final String? hintText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '',
              style: context.sixteen400.copyWith(color: context.grey900)),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  hintText: hintText ?? 'Search Property...',
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
      ),
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
