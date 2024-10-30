import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';

class KeyWidget extends StatelessWidget {
  const KeyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.grey50,
      ),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SelectableText(
            state.secretKeySignUpDataSate.data?.secret ?? 'No Key Found',
            style: context.sixteen400,
          );
        },
      ),
    );
  }
}
