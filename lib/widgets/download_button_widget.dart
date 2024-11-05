import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DownloadButtonWidget extends StatelessWidget {
  const DownloadButtonWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      crossAxisAlignment: CrossAxisAlignment.start,
      title: 'Agreement',
      titleStyle: context.sixteen400,
      trailing: Row(
        children: [
          const AssetIcon.multicolor(AssetIcons.upload_icon),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'Download',
              style: context.sixteen400.withColor(context.primary500),
            ),
          ),
        ],
      ),
    );
  }
}
