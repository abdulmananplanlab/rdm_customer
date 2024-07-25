part of '../view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> propertyTypes = const [
      'Apartment',
      'Condos',
      'Townhome',
      'Single Family',
      'Multi-Family',
    ];
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'Home',
        actions: [
          GestureDetector(
            onTap: () {
              // context.push(NotificationPage.route());
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const NotificationPage(),
                ),
              );
            },
            child: const AssetIcon.monotone(AssetIcons.alert),
          ),
        ],
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: AssetIcon.monotone(AssetIcons.menu),
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 480,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/home_background_image.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const TopSelectionWidget()
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            NearByListings(propertyTypes: propertyTypes),
            const SizedBox(
              height: 30,
            ),
            LatestListingWidget(propertyTypes: propertyTypes),
          ],
        ),
      ),
    );
  }
}

class TopSelectionWidget extends StatelessWidget {
  const TopSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let’s Find You Perfect Dream Home!',
            style: context.twenty600?.copyWith(color: context.grey900),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Search from our listings below.',
            style: context.sixteen400.copyWith(color: context.grey900),
          ),
          const SizedBox(
            height: 20,
          ),
          const FilterSelectionWidget(
            firstTab: 'Buy ',
            secondTab: 'Sell',
          ),
          const PropertyDetailsOptions(),
        ],
      ),
    );
  }
}
