import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/help_center/cubit/help_center_cubit.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class FrequentlyAskingWidget extends StatefulWidget {
  const FrequentlyAskingWidget({
    super.key,
  });

  @override
  State<FrequentlyAskingWidget> createState() => _FrequentlyAskingWidgetState();
}

class _FrequentlyAskingWidgetState extends State<FrequentlyAskingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitleSubtitle(
            title: 'Frequently Asked Questions',
            subtitle: 'Get help from our frequently asked questions.',
          ),
          const VerticalSpacing(),
          Column(
            children: [
              const SimpleTextViewWidget(),
              BlocBuilder<HelpCenterCubit, HelpCenterState>(
                buildWhen: (previous, current) =>
                    previous.isExpanded != current.isExpanded,
                builder: (context, state) {
                  if (state.isExpanded) {
                    return const ExpandedTextViewWidget();
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandedTextViewWidget extends StatelessWidget {
  const ExpandedTextViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.white,
          border: Border(
            bottom: BorderSide(color: context.grey300),
            left: BorderSide(color: context.grey300),
            right: BorderSide(color: context.grey300),
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: const Text(
            'On the login screen ,there should be a "forgot password" option. Tap on it, and the app will guide you through the steps to reset your password .'));
  }
}

class SimpleTextViewWidget extends StatelessWidget {
  const SimpleTextViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HelpCenterCubit>().state;
    return CustomColorContainer(
      borderColor: state.isExpanded ? context.grey300 : context.transparent,
      margin: EdgeInsets.zero,
      borderRadius: state.isExpanded
          ? const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            )
          : null,
      child: Column(
        children: [
          CustomListTile(
            crossAxisAlignment: CrossAxisAlignment.start,
            title: ' I forgot my password. How can I reset it?',
            trailing: GestureDetector(
              onTap: context.read<HelpCenterCubit>().setIsExpanded,
              child: AssetIcon.multicolor(
                state.isExpanded
                    ? AssetIcons.drop_up
                    : AssetIcons.dropdown_icon,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
