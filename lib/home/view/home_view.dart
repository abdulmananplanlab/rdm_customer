part of 'view.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let’s Find You Perfect Dream Home!',
                        style:
                            context.twenty600?.copyWith(color: context.grey900),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Search from our listings below.',
                        style:
                            context.sixteen400.copyWith(color: context.grey900),
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
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyChipWidget(propertyTypes: propertyTypes),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Near Your Location",
                    style: context.sixteen600.copyWith(color: context.grey900),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const PropertyListingsWidget()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyListingsWidget extends StatelessWidget {
  const PropertyListingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          const ListingTopContainer(),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$3,125 - \$3,750/mo",
                      style: context.eighteen600,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: context.grey50,
                          child: Container(
                            height: 10,
                            width: 5,
                            decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              color: context.success500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text("For Rent"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Verified Listing',
                  style: context.sixteen600,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const AssetIcon.monotone(AssetIcons.home_other),
                    const SizedBox(width: 4),
                    Text(
                      'Single Family',
                      style: context.twelve400,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListingTopContainer extends StatelessWidget {
  const ListingTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      child: Stack(
        children: [
          const NetworkImageWidget(
            imageUrl:
                'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(children: [
              CustomIconWidget(
                onTap: () {},
                assetIcon:
                    const AssetIcon.multicolor(AssetIcons.grey_share_icon),
              ),
              const SizedBox(
                width: 8,
              ),
              CustomIconWidget(
                onTap: () {},
                assetIcon: const AssetIcon.multicolor(AssetIcons.heart_icon),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.assetIcon,
    required this.onTap,
  });
  final AssetIcon assetIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33), color: context.white),
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(onTap: onTap, child: assetIcon));
  }
}

class PropertyChipWidget extends StatelessWidget {
  const PropertyChipWidget({
    super.key,
    required this.propertyTypes,
  });

  final List<String> propertyTypes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Browse Properties',
          style: context.sixteen600.copyWith(color: context.grey900),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: propertyTypes
                    .map((title) => PropertyChips(
                          title: title,
                        ))
                    .toList()))
      ],
    );
  }
}

class PropertyChips extends StatelessWidget {
  const PropertyChips({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.grey200)),
        child: Text(
          title,
          style: context.sixteen400.copyWith(color: context.grey900),
        ));
  }
}

class FilterSelectionWidget extends StatefulWidget {
  const FilterSelectionWidget({
    super.key,
    required this.firstTab,
    required this.secondTab,
  });

  final String firstTab;
  final String secondTab;

  @override
  State<FilterSelectionWidget> createState() => _FilterSelectionWidgetState();
}

class _FilterSelectionWidgetState extends State<FilterSelectionWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 0 ? context.primary500 : context.white,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(16)),
                  ),
                  child: Text(widget.firstTab,
                      style: context.sixteen400.withColor(selectedIndex == 1
                          ? context.primary500
                          : context.white))),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? context.primary500 : context.white,
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(16)),
                  ),
                  child: Text(widget.secondTab,
                      style: context.sixteen400.withColor(selectedIndex == 1
                          ? context.white
                          : context.primary500))),
            ),
          ],
        ),
      ],
    );
  }
}

class PropertyDetailsOptions extends StatelessWidget {
  const PropertyDetailsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const PropertyTypeWidget(),
            const SizedBox(
              height: 12,
            ),
            const SearchLocationWidget(
              title: 'Location',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomElevatedButton.expanded(
                onPressed: () {}, text: 'Search Properties'),
          ],
        ),
      ),
    );
  }
}

class BuyWidget extends StatelessWidget {
  const BuyWidget({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(title)),
    );
  }
}

class SellWidget extends StatelessWidget {
  const SellWidget({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(title)),
    );
  }
}
