import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 123,
      menuStyle: MenuStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.white),
      ),
      selectedTrailingIcon: const AssetIcon.monotone(AssetIcons.dropdown_icon),
      trailingIcon: const AssetIcon.monotone(AssetIcons.dropdown_icon),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: context.grey900,
        activeIndicatorBorder: BorderSide(color: context.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.grey300),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      hintText: 'Sort By',
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: 'Rent',
          label: 'Rent',
        ),
        DropdownMenuEntry(value: 'Buy', label: 'Buy'),
      ],
    );
  }
}
