import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_drop_down_menu.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            hintText: 'Search Property...',
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        CustomDropDownMenu(),
      ],
    );
  }
}
