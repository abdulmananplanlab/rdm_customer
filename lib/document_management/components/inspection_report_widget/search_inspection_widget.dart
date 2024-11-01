import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_drop_down_button2.dart';

class SearchInspectionWidget extends StatelessWidget {
  const SearchInspectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        CustomDropdownButton2(
          dropdownWidth: 125,
          onChanged: (value) {},
          dropdownItems: ['Approved', 'Pending', 'Rejected'],
          hint: 'Status',
        ),
        // CustomDropDownMenu(),
      ],
    );
  }
}
