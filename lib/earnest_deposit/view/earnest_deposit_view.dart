part of 'view.dart';

class EarnestDepositScreen extends StatelessWidget {
  const EarnestDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: const CustomAppBar(
          title: 'Earnest Deposit',
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
                        selectedIndex: 3,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'SStep 3 of 5',
                        style: context.sixteen500.withColor(context.primary500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTitleSubtitle(
                          title: 'Rental Deposit Required',
                          subtitle:
                              '6% Earnest money is required to further proceed your request.'),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomSideBorderWidget(
                          radius: BorderRadius.circular(8),
                          width: double.infinity,
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(4),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Asking Price',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Text(
                                    '\$20,000',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Inspection Report',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '\$100',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Rental Agreement',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '1.00%',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Taxes & Duty',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '0.25%',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Identity Verification',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '0.25%',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Transport & Logistics',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '0.25%',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'RealWealtdy Fees',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                  trailing: Text(
                                    '4.00%',
                                    style: context.sixteen400
                                        .withColor(context.grey500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Total',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Text(
                                    '6.00%',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomListTile(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  customTitle: Text(
                                    'Earnest Money',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                  trailing: Text(
                                    '1,200\$',
                                    style: context.sixteen600
                                        .withColor(context.grey900),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const DepositNoteWidget(),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Select Payment Method',
                        style: context.sixteen600.withColor(context.grey900),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      PaymentSelectWidget(
                        onChanged: (value) {},
                        subtitle: '**** 0123',
                        icon: const AssetIcon.multicolor(
                            AssetIcons.visa_payment_icon),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      PaymentSelectWidget(
                        onChanged: (value) {},
                        subtitle: '**** 0123',
                        icon: const AssetIcon.multicolor(
                            AssetIcons.mastercard_payment_icon),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      PaymentSelectWidget(
                        socialPayment: true,
                        onChanged: (value) {},
                        icon:
                            const AssetIcon.multicolor(AssetIcons.google_icon),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      PaymentSelectWidget(
                        socialPayment: true,
                        onChanged: (value) {},
                        icon: const AssetIcon.multicolor(AssetIcons.apple_icon),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomElevatedButton.expanded(
                        text: 'Proceed',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PaymentSelectWidget extends StatelessWidget {
  const PaymentSelectWidget({
    super.key,
    this.icon,
    required this.onChanged,
    this.subtitle,
    this.padding,
    this.socialPayment = false,
  });

  final AssetIcon? icon;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final EdgeInsets? padding;
  final bool socialPayment;

  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      borderColor: context.grey20,
      padding: padding ?? const EdgeInsets.all(16),
      child: CustomListTile(
        crossAxisAlignment: CrossAxisAlignment.start,
        leading: icon ??
            const AssetIcon.multicolor(AssetIcons.visa_payment_icon, size: 30),
        customTitle: Text(
          'Visa',
          style: context.sixteen600.withColor(context.grey900),
        ),
        customSubtitle: socialPayment
            ? const SizedBox.shrink()
            : Text(
                subtitle ?? '',
                style: context.sixteen400.withColor(context.grey900),
              ),
        trailing: LabeledRadio(
          value: false,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class DepositNoteWidget extends StatelessWidget {
  const DepositNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColorContainer(
        borderColor: context.warning50,
        color: context.warning50,
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Note',
              style: context.twelve600.withColor(context.grey900),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using is that it has a more or less normal distribution of letters, as opposed to using making it look like readable English.',
              style: context.twelve400.withColor(context.grey900),
            ),
          ],
        ));
  }
}
