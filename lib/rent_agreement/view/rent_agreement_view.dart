part of 'view.dart';

class RentAgreementScreen extends StatelessWidget {
  const RentAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const CustomAppBar(
        title: 'Rent Agreement',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomProgressBar(
                    selectedIndex: 2,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Step 2 of 5',
                    style: context.sixteen500.withColor(context.primary500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTitleSubtitle(
                      title: 'Residential Lease Agreement',
                      subtitle:
                          'Please carefully review the Agreement to Lease Real Estate before signing.'),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomSideBorderWidget(
                    radius: BorderRadius.circular(8),
                    width: double.infinity,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Deposit Price',
                                style: context.sixteen400
                                    .withColor(context.grey500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const AssetIcon.multicolor(
                                  AssetIcons.exclamation_icon_grey),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$20,000',
                            style: context.twentyFour600
                                ?.withColor(context.grey900),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomInkWell(
                            elevation: 0,
                            color: context.transparent,
                            onTap: () {},
                            child: CustomCheckBox(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              value: false,
                              onChanged: (value) {},
                              child: RichText(
                                text: TextSpan(
                                  style: context.sixteen400,
                                  text:
                                      'I confirm that I have read and understood and I agree to this ',
                                  children: [
                                    TextSpan(
                                      style: context.sixteen600,
                                      text: 'Rental Agreement',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomElevatedButton.expanded(
                            text: 'Proceed',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EarnestDepositPage()));
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
