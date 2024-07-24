import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/help_center/view/view.dart';
import 'package:rdm_builder_customer/message/message.dart';
import 'package:rdm_builder_customer/setting/view/view.dart';
import 'package:rdm_builder_customer/widgets/custom_text_button.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    this.drawerItemDataList,
  });

  final List<DrawerItemData>? drawerItemDataList;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _tooltipController = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthRepository value) => value.currentUser);

    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerHeader(
                    context,
                    user,
                    true,
                    _tooltipController,
                  ),
                  ..._buildItemList(
                    context,
                    widget.drawerItemDataList ?? DrawerItemData.data(context),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextButton(
              title: 'Become an Inspector',
              onPressed: () {},
            ),
            const VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomOutlinedButton.expanded(
                textStyle: context.sixteen400,
                isSpacer: true,
                leading: AssetIcon.monotone(
                  AssetIcons.logout,
                  size: 24,
                  color: context.error500,
                ),
                borderColor: context.error50,
                backgroundColor: context.white,
                foregroundColor: context.error500,
                text: 'Sign Out',
                onPressed: () {
                  context.read<AuthRepository>().logOut();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(
    BuildContext context,
    User? user,
    bool isFocalPerson,
    OverlayPortalController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AssetIcon.monotone(AssetIcons.arrow_left),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 1.2,
                  // opacity: 0.8,
                  image: AssetImage(
                    'assets/images/drawer_background.png',
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 30,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: context.white,
                          spreadRadius: 12,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/Avatar.png'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  CustomTitleSubtitle(
                    subtitleStyle: context.twelve400.withColor(context.white),
                    titleStyle: context.sixteen700.withColor(context.white),
                    title: 'Robert Fox',
                    subtitle: 'robertfox@email.com',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  List<Widget> _buildItemList(
    BuildContext context,
    List<DrawerItemData> itemDataList,
  ) {
    return [
      for (final DrawerItemData item in itemDataList)
        ListTile(
          leading: item.icon == null
              ? null
              : SizedBox(
                  height: 24,
                  child: AssetIcon.monotone(item.icon ?? AssetIcons.blank),
                ),
          horizontalTitleGap: 12,
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          title: Text(
            item.title,
            style: context.sixteen400,
          ),
          onTap: item.onTap,
        ),
    ];
  }
}

class DrawerItemData {
  DrawerItemData({
    required this.title,
    this.icon,
    this.onTap,
    this.subRoutes = const [],
  });
  final String title;
  final AssetIcons? icon;
  final void Function()? onTap;
  final List<DrawerItemData> subRoutes;

  static List<DrawerItemData> data(BuildContext context) {
    return [
      DrawerItemData(
        title: 'Offer Management',
        icon: AssetIcons.offer_management_icon,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      DrawerItemData(
        title: 'Rent/Purchase Management',
        icon: AssetIcons.rent_icon,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(MessagePage.route());
        },
      ),
      DrawerItemData(
        title: 'Funds Balance',
        icon: AssetIcons.fund_balance_icon,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(MessagePage.route());
        },
      ),
      DrawerItemData(
        title: 'Document Management',
        icon: AssetIcons.documnet_management_icon,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(MessagePage.route());
        },
      ),
      DrawerItemData(
        title: 'Messages',
        icon: AssetIcons.messages,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MessagePage.route());
        },
      ),
      DrawerItemData(
        title: 'Settings',
        icon: AssetIcons.settings,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(SettingPage.route());
        },
      ),
      DrawerItemData(
        title: 'Help Center',
        icon: AssetIcons.help_center,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(HelpCenterPage.route());
        },
      ),
      // DrawerItemData(
      //   title: 'Log out',
      //   icon: AssetIcons.authenticator_app,
      //   onTap: () {
      //     showDialog<AlertDialog>(
      //       context: context,
      //       builder: (BuildContext dialogContext) {
      //         return AlertDialog(
      //           title: Text(
      //             'Are you sure you want to log out?',
      //             style: context.twenty700,
      //           ),
      //           actions: <Widget>[
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 TextButton(
      //                   child: Text(
      //                     'Cancel',
      //                     style: context.sixteen400,
      //                   ),
      //                   onPressed: () {
      //                     Navigator.of(dialogContext)
      //                         .pop(); // Dismiss alert dialog
      //                   },
      //                 ),
      //                 TextButton(
      //                   child: Text(
      //                     'Yes, Confirm',
      //                     style: context.sixteen400,
      //                   ),
      //                   onPressed: () {
      //                     context.read<AuthRepository>().logOut();
      //                   },
      //                 ),
      //               ],
      //             ),
      //           ],
      //         );
      //       },
      //     );
      //     //
      //   },
      // ),
    ];
  }
}

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        width: width ?? double.infinity,
        height: height ?? 150,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return child ??
              Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              );
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
