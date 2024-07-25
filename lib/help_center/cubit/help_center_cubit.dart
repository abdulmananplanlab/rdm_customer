import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rdm_builder_customer/help_center/model/help_center_model.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit()
      : super(
          HelpCenterState(
            helpCenterList: [
              HelpCenterModel(
                title: ' I forgot my password. How can I reset it?',
                subTitle:
                    'On the login screen, there should be a "Forgot Password" option. Tap on it, and the app will guide you through the steps to reset your password.',
                isExpanded: false,
              ),
              HelpCenterModel(
                title: ' How can I contact the seller?',
                subTitle:
                    'Look for a "Contact" or "Message" button within the app. If not, you may find their contact details in the property description or through a dedicated contact section.',
                isExpanded: false,
              ),
              HelpCenterModel(
                title: 'How does the app protect my personal information?',
                subTitle:
                    'Look for information in the app\'s settings, terms of service, or privacy policy to understand the security measures in place.',
                isExpanded: false,
              ),
            ],
          ),
        );

  void setIsExpanded(int index) {
    List<HelpCenterModel> newList = List.of(state.helpCenterList);

    newList[index] =
        newList[index].copyWith(isExpanded: !newList[index].isExpanded);
    emit(state.copyWith(helpCenterList: newList));
  }
}
