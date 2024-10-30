import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';

class QrCodeImage extends StatelessWidget {
  const QrCodeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final result = state.qrImageSignUpDataSate.data?.qrCodeUrl ?? '';
        final results = const Base64Decoder().convert(
          result.split(',').last,
        );
        return Center(
          child: Image.memory(
            results,
            height: 150,
            width: 150,
          ),
        );
      },
    );
  }
}
