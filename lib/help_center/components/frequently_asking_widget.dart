import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/help_center/cubit/help_center_cubit.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class FrequentlyAskingWidget extends StatelessWidget {
  const FrequentlyAskingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitleSubtitle(
            title: 'Frequently Asked Questions ',
            subtitle: 'Get help from our frequently asked questions.',
          ),
          const VerticalSpacing(),
          BlocBuilder<HelpCenterCubit, HelpCenterState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.helpCenterList.length,
                primary: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = state.helpCenterList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.grey50,
                            borderRadius: data.isExpanded
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  )
                                : null,
                            border: Border.all(
                              color: data.isExpanded
                                  ? context.grey200
                                  : context.transparent,
                            ),
                          ),
                          duration: const Duration(milliseconds: 500),
                          child: CustomListTile(
                            title: data.title,
                            titleStyle: context.sixteen400,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            trailing: GestureDetector(
                              onTap: () => context
                                  .read<HelpCenterCubit>()
                                  .setIsExpanded(index),
                              child: AssetIcon.multicolor(
                                data.isExpanded
                                    ? AssetIcons.drop_up
                                    : AssetIcons.dropdown_icon,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        if (data.isExpanded)
                          AnimatedContainer(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.white,
                              border: Border(
                                bottom: BorderSide(color: context.grey200),
                                left: BorderSide(color: context.grey200),
                                right: BorderSide(color: context.grey200),
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              data.subTitle,
                              style:
                                  context.sixteen400.withColor(context.grey500),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
