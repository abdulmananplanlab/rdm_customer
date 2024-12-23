import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_drop_down_button2.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        CustomDropdownButton2(
          dropdownWidth: 120,
          onChanged: (value) {},
          dropdownItems: ['Rent', 'Buy'],
          hint: 'Sort By',
        ),
        // CustomDropDownMenu(),
      ],
    );
  }
}
