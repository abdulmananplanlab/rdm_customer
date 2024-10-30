import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/Identity_verification/Identity_verification/view/view.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/components/code_textfield.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/components/key_widget.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/components/qr_code_image.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/components/verify_button.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/cubit/two_fa_authentication_app_cubit.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/repository/two_fa_authenticator_repository_impl.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';

part 'two_fa_authenticator_app_page.dart';
part 'two_fa_authenticator_app_view.dart';
