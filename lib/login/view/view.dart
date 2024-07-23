import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:rdm_builder_customer/account_verification/account_verification.dart';
import 'package:rdm_builder_customer/login/components/check_box_forget_password_widget.dart';
import 'package:rdm_builder_customer/login/components/email_text_field.dart';
import 'package:rdm_builder_customer/login/components/password_text_field.dart';
import 'package:rdm_builder_customer/login/components/sign_in_button.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';
import 'package:rdm_builder_customer/login/repository/login_repository.dart';
import 'package:rdm_builder_customer/sign_up/sign_up.dart';
import 'package:rdm_builder_customer/widgets/or_widget.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

part 'login_page.dart';
part 'login_view.dart';
