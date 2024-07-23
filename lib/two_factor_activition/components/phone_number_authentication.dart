import 'dart:developer';

import 'package:common/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumberAuthentication extends StatefulWidget {
  const PhoneNumberAuthentication({
    super.key,
  });

  @override
  State<PhoneNumberAuthentication> createState() =>
      _PhoneNumberAuthenticationState();
}

class _PhoneNumberAuthenticationState extends State<PhoneNumberAuthentication> {
  Country selectedCountry = Country(
    e164Sc: 1,
    phoneCode: '1',
    countryCode: 'US',
    name: 'United States',
    geographic: true,
    level: 2,
    example: '',
    displayName: '',
    displayNameNoCountryCode: '',
    e164Key: '',
  );
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
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      selectedCountry.flagEmoji,
                      style: const TextStyle(
                        fontSize: 50,
                      ), // Adjust font size if needed
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '+${selectedCountry.phoneCode}',
                style: context.sixteen400,
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
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    // optional. Shows phone code before the country name.
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                      });
                      // context
                      //     .read<TwoFactorActivationCubit>()
                      //     .selectCountry(country);
                      log('Select country: ${country.displayName}');
                    },
                  );
                },
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: CustomTextFormField(
            keyboardType: TextInputType.number,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            hintText: 'ex. 234 567 890',
          ),
        ),
      ],
    );
  }
}
