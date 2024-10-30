import 'package:common/widgets/text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/cubit/two_fa_authentication_app_cubit.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoFaAuthenticationAppCubit,
        TwoFaAuthenticationAppState>(
      buildWhen: (previous, current) => previous.token != current.token,
      builder: (context, state) {
        return CustomTextFormField(
          hasError: state.token.invalid,
          keyboardType: TextInputType.number,
          onChanged:
              context.read<TwoFaAuthenticationAppCubit>().authenticatorCode,
          hintText: '000-000',
        );
      },
    );
  }
}
