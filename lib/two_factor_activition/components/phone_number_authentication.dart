import 'package:common/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/two_factor_activition/cubits/two_factor_activition_cubit.dart';

class PhoneNumberAuthentication extends StatelessWidget {
  const PhoneNumberAuthentication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ), // Adjust width based on picture
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            border: Border(
              bottom: BorderSide(
                color: context.grey300,
              ),
              top: BorderSide(
                color: context.grey300,
              ),
              left: BorderSide(
                color: context.grey300,
              ),
            ), // Adjust border
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              BlocBuilder<TwoFactorActivationCubit, TwoFactorActivationState>(
                buildWhen: (previous, current) =>
                    previous.selectedCountry != current.selectedCountry,
                builder: (context, state) {
                  return CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          state.selectedCountry.flagEmoji,
                          style: const TextStyle(
                            fontSize: 50,
                          ), // Adjust font size if needed
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              BlocBuilder<TwoFactorActivationCubit, TwoFactorActivationState>(
                buildWhen: (previous, current) =>
                    previous.selectedCountry != current.selectedCountry,
                builder: (context, state) {
                  return Text(
                    '+${state.selectedCountry.phoneCode}',
                    style: context.sixteen400,
                  );
                },
              ),
              const SizedBox(width: 4),
              IconButton(
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                padding: EdgeInsets.zero,
                iconSize: 12,
                onPressed: () {
                  final phoneNumberCubit =
                      context.read<TwoFactorActivationCubit>();

                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: phoneNumberCubit.selectCountry,
                  );
                },
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                previous.otpPhoneNumberSignUp != current.otpPhoneNumberSignUp,
            builder: (context, state) {
              return CustomTextFormField(
                hasError: state.otpPhoneNumberSignUp.invalid,
                onChanged: context.read<AuthCubit>().phoneNumber,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                keyboardType: TextInputType.number,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                hintText: 'ex. 234 567 890',
              );
            },
          ),
        ),
      ],
    );
  }
}
