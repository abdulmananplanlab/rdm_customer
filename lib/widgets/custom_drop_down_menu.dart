import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 100,
      menuStyle: MenuStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.white),
      ),
      selectedTrailingIcon: const AssetIcon.monotone(AssetIcons.dropdown_icon),
      trailingIcon: const AssetIcon.monotone(AssetIcons.dropdown_icon),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: context.sixteen400,
        // contentPadding: const EdgeInsets.symmetric(horizontal: 14),
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
        DropdownMenuEntry(
          value: 'Buy',
          label: 'Buy',
        ),
      ],
    );
  }
}

class UpwardDropdownButton extends StatefulWidget {
  final String? initialSelectedValue;
  final List<String> options;
  final ValueChanged<String?>? onChanged;

  const UpwardDropdownButton({
    super.key,
    this.initialSelectedValue,
    required this.options,
    this.onChanged,
  });

  @override
  UpwardDropdownButtonState createState() => UpwardDropdownButtonState();
}

class UpwardDropdownButtonState extends State<UpwardDropdownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedValue ?? 'Select';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(button.size.bottomRight(Offset.zero),
                ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero),
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu<String>(
          color: context.white,
          context: context,
          position: position,
          items: widget.options
              .map((option) => PopupMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: context.sixteen500,
                    ),
                  ))
              .toList(),
        ).then((value) {
          if (value != null) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          border: Border.all(color: context.grey300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedValue!,
              style: context.sixteen500,
            ),
            SizedBox(width: 8),
            const AssetIcon.monotone(AssetIcons.dropdown_icon),
          ],
        ),
      ),
    );
  }
}
