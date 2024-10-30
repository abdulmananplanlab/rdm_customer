import 'dart:io';

import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/login/view/view.dart';
import 'package:rdm_builder_customer/sign_up/components/components.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';
import 'package:rdm_builder_customer/sign_up/repository/sign_up_repository_imp.dart';
import 'package:rdm_builder_customer/widgets/custom_pinput.dart';
import 'package:rdm_builder_customer/widgets/or_widget.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

part 'sign_up_page.dart';
part 'sign_up_view.dart';
