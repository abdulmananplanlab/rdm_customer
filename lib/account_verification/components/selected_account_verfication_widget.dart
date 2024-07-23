import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/account_verification/cubit/account_verification_cubit.dart';
import 'package:rdm_builder_customer/widgets/custom_border_list_tiles.dart';

class SelectedAccountVerificationWidget extends StatelessWidget {
  const SelectedAccountVerificationWidget({
    super.key,
    this.isEmailAvailable = false,
  });

  final bool isEmailAvailable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
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
              onTap: (context) =>
                  context.read<AccountVerificationCubit>().selectMethod(1),
              isColor: state.selectedIndex == 1,
            ),
            const SizedBox(height: 16),
            if (isEmailAvailable)
              Column(
                children: [
                  CustomBorderListTiles(
                    title: 'Email',
                    subTitle: 'Receive a code at realtor@email.com',
                    icon: AssetIcons.mail,
                    onTap: (context) => context
                        .read<AccountVerificationCubit>()
                        .selectMethod(2),
                    isColor: state.selectedIndex == 2,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            CustomBorderListTiles(
              title: 'Authenticator App',
              subTitle: 'Retrieve the 6 digit code from authenticator app.',
              icon: AssetIcons.authenticator_app,
              onTap: (context) =>
                  context.read<AccountVerificationCubit>().selectMethod(3),
              isColor: state.selectedIndex == 3,
            ),
          ],
        );
      },
    );
  }
}