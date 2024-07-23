import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/account_verification/cubit/account_verification_cubit.dart';
import 'package:rdm_builder_customer/two_factor_activition/two_fa_authenticator_app.dart';
import 'package:rdm_builder_customer/two_factor_activition/view/view.dart';
import 'package:rdm_builder_customer/widgets/custom_border_list_tiles.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

class TwoFaAuthentication extends StatelessWidget {
  const TwoFaAuthentication({
    super.key,
    this.isSupport = false,
    this.text,
  });

  final bool? isSupport;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountVerificationCubit>(
      create: (context) => AccountVerificationCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: '2FA Activation',
        ),
        backgroundColor: context.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProgressBar(),
              const SizedBox(height: 24),
              Text(
                'Step 1 of 5',
                style: context.sixteen500.withColor(context.primary500),
              ),
              const SizedBox(height: 8),
              const CustomTitleSubtitle(
                title: '2Factor Authentication',
                subtitle:
                    'Two Factor Authentication (2FA) helps prevent unauthorized access.',
              ),
              const SizedBox(height: 32),
              Text(
                'Choose your preferred MFA method:',
                style: context.sixteen600,
              ),
              BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
                buildWhen: (previous, current) =>
                    previous.selectedIndex != current.selectedIndex,
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      CustomBorderListTiles(
                        title: 'Phone Number',
                        subTitle: 'Receive a code at +1 234 567 890',
                        icon: AssetIcons.new_message,
                        onTap: (context) => context
                            .read<AccountVerificationCubit>()
                            .selectMethod(1),
                        isColor: state.selectedIndex == 1,
                      ),
                      const SizedBox(height: 16),
                      CustomBorderListTiles(
                        title: 'Authenticator App',
                        subTitle:
                            'Retrieve the 6 digit code from authenticator app.',
                        icon: AssetIcons.authenticator_app,
                        onTap: (context) => context
                            .read<AccountVerificationCubit>()
                            .selectMethod(2),
                        isColor: state.selectedIndex == 2,
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
                buildWhen: (previous, current) =>
                    previous.selectedIndex != current.selectedIndex,
                builder: (context, state) {
                  return CustomElevatedButton(
                    trailing: isSupport == true
                        ? const AssetIcon.monotone(AssetIcons.arrow_right)
                        : const SizedBox.shrink(),
                    width: double.infinity,
                    text: text ??
                        (state.selectedIndex == 0 ? 'Continue' : 'Verify'),
                    onPressed: state.selectedIndex == 0
                        ? () {}
                        : () {
                            if (state.selectedIndex == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute<TwoFaActivationView>(
                                  builder: (_) => const TwoFaActivationView(),
                                ),
                              );
                            }
                            if (state.selectedIndex == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute<TwoFaAuthenticatorApp>(
                                  builder: (_) => const TwoFaAuthenticatorApp(),
                                ),
                              );
                            }
                          },
                  );
                },
              ),
              const SizedBox(height: 16),
              if (isSupport == false)
                Center(
                  child: RichTextWidgets(
                    colorTextStyle:
                        context.twelve500.withColor(context.primary500),
                    style: context.twelve400,
                    colorTitle: 'Customer Support',
                    simpleTitle: "Facing issues? We're here to assist. ",
                    onTap: (context) {},
                  ),
                )
              else
                const SizedBox.shrink(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
