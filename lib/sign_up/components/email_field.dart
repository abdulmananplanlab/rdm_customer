import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextWithTextFieldWidget(
          hasError: state.email.invalid,
          keyboardType: TextInputType.emailAddress,
          onChanged: context.read<SignUpCubit>().email,
          text: 'Email Address',
          hintText: 'ex. robertfox@email.com',
        );
      },
    );
  }
}
