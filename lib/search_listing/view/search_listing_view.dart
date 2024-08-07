part of 'view.dart';

class SearchListingScreen extends StatelessWidget {
  const SearchListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: CustomAppBar(
          title: 'Search',
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SearchLocationWidget(
              hintText: 'Search Location...',
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Divider(),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "100+ Results",
                style: context.sixteen400.withColor(context.grey500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const HorizontalListingsWidget(
                    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16)))
          ]),
        ));
  }
}
