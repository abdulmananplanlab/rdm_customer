import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';

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
              const AssetIcon.monotone(AssetIcons.menu),
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
                  image: AssetImage(
                    'assets/images/drawer_background.png',
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 30,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/drawer_image1.png'),
                  ),
                  const SizedBox(width: 10),
                  CustomTitleSubtitle(
                    isIcon: true,
                    subtitleStyle: context.twelve400.withColor(context.white),
                    titleStyle: context.sixteen700.withColor(context.white),
                    title: 'Realty',
                    subtitle: 'Unlocking Your Dream \n Home!',
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitleSubtitle(
                title: 'Complete Your Profile',
                isSubtitle: false,
              ),
              const SizedBox(height: 10),
              const CustomListTile(
                leading: Text(
                  'Progress',
                ),
                trailing: Text(
                  '100 %',
                ),
              ),
              const SizedBox(height: 8),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * .69,
                animation: true,
                animationDuration: 2000,
                percent: 1.0,
                progressColor: context.primary500,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Divider(
          color: Color(0xFFE5E5E5),
          thickness: 1,
          height: 1,
        ),
        const SizedBox(height: 24),
        if (isFocalPerson)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomListTile(
              titleStyle: context.twelve400.withColor(context.grey500),
              subtitleStyle: context.sixteen600,
              leading: const ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                child: NetworkImageWidget(
                  height: 50,
                  width: 50,
                  imageUrl:
                      'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
              title: 'Focal Person',
              subtitle: 'James Smith',
              trailing: MenuAnchor(
                style: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(context.transparent),
                  elevation: WidgetStateProperty.all(0),
                ),
                alignmentOffset: Offset.fromDirection(0, -160),
                crossAxisUnconstrained: false,
                builder: (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  return IconButton(
                    highlightColor: context.transparent,
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.more_horiz),
                  );
                },
                menuChildren: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF091409).withOpacity(1 / 100),
                          offset: const Offset(-10, 10),
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: context.white,
                      border: Border.all(
                        color: context.grey200,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Change Focal Person',
                                style: context.twelve400,
                              ),
                              const SizedBox(width: 8),
                              const AssetIcon.monotone(
                                size: 20,
                                AssetIcons.edit,
                              ),
                            ],
                          ),
                        ),
                        const AssetIcon.multicolor(
                          size: 1,
                          AssetIcons.line,
                        ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: Divider(
                        //     color: context.grey200,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delete Focal Person',
                                style: context.twelve400
                                    .withColor(context.error500),
                              ),
                              const SizedBox(width: 8),
                              AssetIcon.monotone(
                                size: 20,
                                AssetIcons.delete_icon,
                                color: context.error500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // CustomInkWell(
              //   onTap: controller.toggle,
              //   child:
              //   OverlayPortal(
              //     controller: controller,
              //     overlayChildBuilder: (BuildContext context) {
              //       return Positioned(
              //         left: 50,
              //         top: MediaQuery.of(context).size.height * .41,
              //         child: DecoratedBox(
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color:
              //                     const Color(0xFF091409).withOpacity(5 / 100),
              //                 offset: const Offset(-10, 10),
              //                 blurRadius: 10,
              //               ),
              //             ],
              //             borderRadius: BorderRadius.circular(8),
              //             color: context.white,
              //             border: Border.all(
              //               color: context.grey200,
              //             ),
              //           ),
              //           child: Column(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       'Change Focal Person',
              //                       style: context.twelve400,
              //                     ),
              //                     const SizedBox(width: 8),
              //                     const AssetIcon.monotone(
              //                       size: 20,
              //                       AssetIcons.edit,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const AssetIcon.multicolor(
              //                 size: 1,
              //                 AssetIcons.line,
              //               ),
              //               // const Divider(
              //               //   indent: 10,
              //               //   endIndent: 90,
              //               //   color: Colors.green,
              //               //   thickness: 2,
              //               // ),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       'Delete Focal Person',
              //                       style: context.twelve400
              //                           .withColor(context.error500),
              //                     ),
              //                     const SizedBox(width: 8),
              //                     AssetIcon.monotone(
              //                       size: 20,
              //                       AssetIcons.delete_icon,
              //                       color: context.error500,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     child: const Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: AssetIcon.monotone(
              //         AssetIcons.dot,
              //         size: 4,
              //       ),
              //     ),
              //   ),
              // ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Focal Person',
                      style: context.twelve600,
                    ),
                    Text(
                      '+11%',
                      style: context.twelve600.withColor(context.primary500),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomOutlinedButton.expanded(
                  textStyle: context.sixteen400,
                  borderColor: context.primary500,
                  backgroundColor: context.white,
                  foregroundColor: context.primary500,
                  text: '+ Add Focal Person',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        const SizedBox(height: 24),
        const Divider(
          color: Color(0xFFE5E5E5),
          thickness: 1,
          height: 1,
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
        title: 'Deals',
        icon: AssetIcons.deals,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      DrawerItemData(
        title: 'Messages',
        icon: AssetIcons.messages,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(MessagePage.route());
        },
      ),
      DrawerItemData(
        title: 'Photography Service',
        icon: AssetIcons.photography_service,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(ConversationsPage.route());
        },
      ),
      DrawerItemData(
        title: 'Settings',
        icon: AssetIcons.settings,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).push(SettingPage.route());
        },
      ),
      DrawerItemData(
        title: 'Help Center',
        icon: AssetIcons.help_center,
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute<TutorialPage>(
          //     builder: (_) => const TutorialPage(),
          //   ),
          // );
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
