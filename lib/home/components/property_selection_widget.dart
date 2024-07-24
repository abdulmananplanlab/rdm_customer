import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/custom_bottomsheet_tile.dart';
import 'package:rdm_builder_customer/home/components/list_text_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_authenticator_code.dart';

class PropertyTypeWidget extends StatelessWidget {
  const PropertyTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextWithTextFieldWidget(
      text: 'Property Type',
      hintText: 'Select',
      onTap: (BuildContext context) => showModalBottomSheet<int>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        builder: (BuildContext context) {
          return CustomBottomSheet(
            mainAxisSize: MainAxisSize.min,
            showDragHandle: false,
            customTitle: const CustomBottomSheetTile(
              title: 'Property Type',
            ),
            content: ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTextWidget(
                  title: "Joyia",
                  onPressed: () {
                    Navigator.pop(context, index);
                  },
                );
              },
            ),
          );
        },
      ).then((value) {
        if (value != null) {
          // context
          //     .read<AddPropertyCubit>()
          //     .changePropertyType(state.propertyTypes[value]);
        }
      }),
      suffixIcon: const AssetIcon.multicolor(
        AssetIcons.dropdown_icon,
      ),
    );
  }
}
