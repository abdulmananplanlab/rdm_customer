import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextWithTextFieldWidget(
          onChanged: context.read<LoginCubit>().email,
          text: 'Email Address',
          hintText: 'ex. robertfox@email.com',
        );
      },
    );
  }
}
