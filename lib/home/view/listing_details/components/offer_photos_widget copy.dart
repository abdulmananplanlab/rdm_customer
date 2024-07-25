import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:realwealtdy_builder/home/components/recent_offer_widgets.dart';

class OfferPhotosWidget extends StatelessWidget {
  const OfferPhotosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: NetworkImageWidget(
                  imageUrl:
                      'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: NetworkImageWidget(
                  imageUrl:
                      'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 5,
          child: CustomElevatedButton(
            leading: const AssetIcon.monotone(AssetIcons.photos),
            text: '41 Photos ',
            textStyle: context.twelve500,
            padding: const EdgeInsets.all(8),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 110,
          left: 120,
          child: CustomElevatedButton(
            leading: const AssetIcon.monotone(
              AssetIcons.virtual_tour,
            ),
            textStyle: context.twelve500,
            text: '5 Virtual Tours',
            padding: const EdgeInsets.all(8),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: CustomElevatedButton(
            leading: const AssetIcon.monotone(AssetIcons.video),
            text: '3 Videos',
            textStyle: context.twelve500,
            padding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
