import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/forget_password/verify_email/cubit/verify_email_cubit.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextWithTextFieldWidget(
          onChanged: context.read<VerifyEmailCubit>().email,
          text: 'Email Address',
          hintText: 'ex. realty@email.com',
        );
      },
    );
  }
}
