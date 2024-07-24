part of 'view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: const CustomAppBar(
        title: 'Notification',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: const ClipOval(
                  child: NetworkImageWidget(
                    height: 40,
                    width: 40,
                    imageUrl:
                        'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                customTitle: Text.rich(
                  TextSpan(
                    text: 'Juanita Weaver',
                    style: context.sixteen600,
                    children: [
                      TextSpan(
                        text: ' submitted a new offer on your property',
                        style: context.sixteen400,
                      ),
                    ],
                  ),
                ),
                subtitleStyle: context.twelve400.withColor(context.grey500),
                subtitle: '3 mins ago',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        height: 40,
                        width: 40,
                        'assets/images/property_image.png',
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: AssetIcon.multicolor(
                        AssetIcons.close_tick,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                titleStyle: context.sixteen400,
                title: 'Property listings has been rejected.',
                subtitle: '1 day ago',
                subtitleStyle: context.twelve400.withColor(context.grey500),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: const ClipOval(
                  child: NetworkImageWidget(
                    height: 40,
                    width: 40,
                    imageUrl:
                        'https://images.pexels.com/photos/432059/pexels-photo-432059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                customTitle: Text.rich(
                  TextSpan(
                    text: 'James Smith',
                    style: context.sixteen600,
                    children: [
                      TextSpan(
                        text: ' has been verified as your Focal Person',
                        style: context.sixteen400,
                      ),
                    ],
                  ),
                ),
                subtitleStyle: context.twelve400.withColor(context.grey500),
                subtitle: '2 day ago',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: const ClipOval(
                  child: NetworkImageWidget(
                    height: 40,
                    width: 40,
                    imageUrl:
                        'https://images.pexels.com/photos/432059/pexels-photo-432059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                customTitle: Text.rich(
                  TextSpan(
                    text: 'Jimmy John',
                    style: context.sixteen600,
                    children: [
                      TextSpan(
                        text: ' scheduled an inspection for your property on',
                        style: context.sixteen400,
                      ),
                      TextSpan(
                        text: ' 10 September 2023',
                        style: context.sixteen600,
                      ),
                    ],
                  ),
                ),
                subtitleStyle: context.twelve400.withColor(context.grey500),
                subtitle: '2 day ago',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: const ClipOval(
                  child: NetworkImageWidget(
                    height: 40,
                    width: 40,
                    imageUrl:
                        'https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=600',
                  ),
                ),
                customTitle: Text.rich(
                  TextSpan(
                    text: 'Joey Welch',
                    style: context.sixteen600,
                    children: [
                      TextSpan(
                        text:
                            ' revised their submitted offer on your property.',
                        style: context.sixteen400,
                      ),
                    ],
                  ),
                ),
                subtitleStyle: context.twelve400.withColor(context.grey500),
                subtitle: '2 day ago',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                height: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                leading: Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        height: 40,
                        width: 40,
                        'assets/images/property_image.png',
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: AssetIcon.multicolor(
                        AssetIcons.approve_tick,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                titleStyle: context.sixteen400,
                title: 'Property listings has been approved.',
                subtitle: '1 day ago',
                subtitleStyle: context.twelve400.withColor(context.grey500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
