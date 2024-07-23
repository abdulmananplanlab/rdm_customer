import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextWithTextFieldWidget(
          onChanged: context.read<SignUpCubit>().firstName,
          text: 'First Name',
          hintText: 'ex. Robert',
        );
      },
    );
  }
}
